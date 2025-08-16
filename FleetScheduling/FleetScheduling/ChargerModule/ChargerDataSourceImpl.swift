import Foundation

struct ChargerDataSourceImpl: ChargerDataSource {
    func fetchChargers() async -> [ChargerModel] {
        guard let url = Bundle.main.url(forResource: "chargerData", withExtension: "json") else {
            return []
        }

        if let data = try? Data(contentsOf: url),
           let result = try? JSONDecoder().decode([ChargerModel].self, from: data) {
            return result
        } else { return [] }
    }
}

