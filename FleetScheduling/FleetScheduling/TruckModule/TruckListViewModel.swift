import Foundation

final class TruckListViewModel: ObservableObject {
    @Published var trucks: [TruckModel] = []
    private let dataSource: TruckDataSource

    init(dataSource: TruckDataSource = TruckDataSourceImpl()) {
        self.dataSource = dataSource
    }
    
    @MainActor
    func fetchTrucks() async {
        trucks =  await dataSource.fetchTrucks()
    }
}
