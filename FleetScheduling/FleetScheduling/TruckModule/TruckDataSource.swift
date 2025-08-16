protocol TruckDataSource {
    func fetchTrucks() async -> [TruckModel]
}
