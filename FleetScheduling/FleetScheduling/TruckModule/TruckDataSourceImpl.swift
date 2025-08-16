import Foundation

struct TruckDataSourceImpl: TruckDataSource {
    func fetchTrucks() async -> [TruckModel] {
        guard let url = Bundle.main.url(forResource: "truckData", withExtension: "json") else {
            return []
        }

        if let data = try? Data(contentsOf: url),
           let result = try? JSONDecoder().decode([TruckModel].self, from: data) {
            return result
        } else { return [] }
    }
}

