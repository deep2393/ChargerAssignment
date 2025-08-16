import Foundation

final class ChargerListViewModel: ObservableObject {
    @Published var chargers: [ChargerModel] = []
    private let dataSource: ChargerDataSource

    init(dataSource: ChargerDataSource = ChargerDataSourceImpl()) {
        self.dataSource = dataSource
        fetchChargers()
    }
    
    private func fetchChargers() {
        Task { @MainActor in
            chargers =  await dataSource.fetchChargers()
        }
    }
}
