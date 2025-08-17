import XCTest
@testable import FleetScheduling

final class TruckListViewModelTests: XCTestCase {
    
    func testFetchTrucksPopulatesTrucks() async {
        // Arrange
        let expectedTrucks = [
            TruckModel(id: UUID(), name: "Truck A", batteryLevel: 50, batteryCapacity: 120),
            TruckModel(id: UUID(), name: "Truck B", batteryLevel: 30, batteryCapacity: 150)
        ]
        let mockDataSource = MockTruckDataSource()
        mockDataSource.trucksToReturn = expectedTrucks
        
        let viewModel = TruckListViewModel(dataSource: mockDataSource)
        
        // Act
        await viewModel.fetchTrucks()
        
        // Assert
        XCTAssertEqual(viewModel.trucks.count, expectedTrucks.count)
        XCTAssertEqual(viewModel.trucks.map(\.name), expectedTrucks.map(\.name))
    }
}

// MARK: - Mock
private final class MockTruckDataSource: TruckDataSource {
    var trucksToReturn: [TruckModel] = []
    func fetchTrucks() async -> [TruckModel] {
        trucksToReturn
    }
}
