import Foundation

final class TruckListViewModel: ObservableObject {
    @Published var trucks: [TruckModel] = []
    private let dataSource: TruckDataSource

    init(dataSource: TruckDataSource = TruckDataSourceImpl()) {
        self.dataSource = dataSource
        fetchTrucks()
    }
    
    private func fetchTrucks() {
        Task { @MainActor in
            trucks =  await dataSource.fetchTrucks()
        }
    }
}
