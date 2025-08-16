import Foundation

final class ChargerListViewModel: ObservableObject {
    @Published var chargers: [ChargerModel] = []
    private let dataSource: ChargerDataSource

    init(dataSource: ChargerDataSource = ChargerDataSourceImpl()) {
        self.dataSource = dataSource
    }

    @MainActor
    func fetchChargers() async {
        chargers = await dataSource.fetchChargers()
    }
}
