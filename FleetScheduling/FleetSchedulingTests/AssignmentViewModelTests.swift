import XCTest
@testable import FleetScheduling

final class AssignmentViewModelTests: XCTestCase {

    func testLoadAssignmentsUpdatesAssignmentResult() async {
        // Arrange
        let trucks = [
            TruckModel(id: UUID(), name: "Truck A", batteryLevel: 20, batteryCapacity: 50),
            TruckModel(id: UUID(), name: "Truck B", batteryLevel: 50, batteryCapacity: 80)
        ]
        let chargers = [
            ChargerModel(id: UUID(), name: "Charger 1", maxKW: 100),
            ChargerModel(id: UUID(), name: "Charger 2", maxKW: 200)
        ]
        
        let mockTruckDataSource = MockTruckDataSource()
        mockTruckDataSource.trucksToReturn = trucks
        
        let mockChargerDataSource = MockChargerDataSource()
        mockChargerDataSource.chargersToReturn = chargers
        
        let mockAlgorithm = MockAssignmentAlgorithm()
        
        let viewModel = AssignmentViewModel(
            truckDataSource: mockTruckDataSource,
            chargerDataSource: mockChargerDataSource,
            assignmentAlgorithm: mockAlgorithm
        )
        viewModel.availableHours = 2.0

        // Act
        await viewModel.loadAssignments()
        
        // Assert
        XCTAssertTrue(mockAlgorithm.assignCalled, "Algorithm should be called")
        XCTAssertEqual(viewModel.assignmentResult.assignments.count, chargers.count)
        XCTAssertEqual(viewModel.assignmentResult.unscheduledTrucks.count, 0)
    }
}

// MARK: - Mocks
private final class MockTruckDataSource: TruckDataSource {
    var trucksToReturn: [TruckModel] = []
    func fetchTrucks() async -> [TruckModel] {
        trucksToReturn
    }
}

private final class MockChargerDataSource: ChargerDataSource {
    var chargersToReturn: [ChargerModel] = []
    func fetchChargers() async -> [ChargerModel] {
        chargersToReturn
    }
}

private final class MockAssignmentAlgorithm: AssignmentAlgorithm {
    var assignCalled = false
    
    func assign(trucks: [TruckModel], chargers: [ChargerModel], availableHours: Double) async -> AssignmentResult {
        assignCalled = true
        
        // simple mock: assign all trucks to first charger
        var assignments = chargers.map { AssignmentModel(charger: $0) }
        if !assignments.isEmpty {
            for truck in trucks {
                assignments[0].truckAssignments.append(
                    TruckAssignment(truck: truck, startTime: Date(), endTime: Date())
                )
            }
        }
        
        return AssignmentResult(assignments: assignments, unscheduledTrucks: [])
    }
}
