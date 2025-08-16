protocol ChargerDataSource {
    func fetchChargers() async -> [ChargerModel]
}
