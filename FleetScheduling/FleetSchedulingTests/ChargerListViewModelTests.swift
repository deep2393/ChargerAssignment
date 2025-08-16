import XCTest
@testable import FleetScheduling

final class ChargerListViewModelTests: XCTestCase {
    
    func testFetchChargersPopulatesChargers() async {
        // Arrange
        let expectedChargers = [
            ChargerModel(id: UUID(), name: "Charger 1", maxKW: 150),
            ChargerModel(id: UUID(), name: "Charger 2", maxKW: 250)
        ]
        let mockDataSource = MockChargerDataSource()
        mockDataSource.chargersToReturn = expectedChargers
        
        let viewModel = ChargerListViewModel(dataSource: mockDataSource)
        
        // Act
        await viewModel.fetchChargers()
        
        // Assert
        XCTAssertEqual(viewModel.chargers.count, expectedChargers.count)
        XCTAssertEqual(viewModel.chargers.map(\.name), expectedChargers.map(\.name))
    }
}

// MARK: - Mock
private final class MockChargerDataSource: ChargerDataSource {
    var chargersToReturn: [ChargerModel] = []
    func fetchChargers() async -> [ChargerModel] {
        chargersToReturn
    }
}
