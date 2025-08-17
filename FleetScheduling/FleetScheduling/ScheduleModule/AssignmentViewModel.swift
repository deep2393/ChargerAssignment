import Foundation

final class AssignmentViewModel: ObservableObject {
    @Published var assignmentResult: AssignmentResult
    private let truckDataSource: TruckDataSource
    private let chargerDataSource: ChargerDataSource
    let assignmentAlgorithm: AssignmentAlgorithm
    @Published var availableHours: Double = 1.0 {
        didSet {
            Task {
                await loadAssignments()
            }
        }
    }
    
    init(assignmentResult: AssignmentResult = .init(assignments: [], unscheduledTrucks: []),
         truckDataSource: TruckDataSource = TruckDataSourceImpl(),
         chargerDataSource: ChargerDataSource = ChargerDataSourceImpl(),
         assignmentAlgorithm: AssignmentAlgorithm = AssignmentAlgorithmImpl()
    ) {
        self.assignmentResult = assignmentResult
        self.truckDataSource = truckDataSource
        self.chargerDataSource = chargerDataSource
        self.assignmentAlgorithm = assignmentAlgorithm
    }
    
    @MainActor
    func loadAssignments() async {
        let trucks =  await truckDataSource.fetchTrucks()
        let chargers = await chargerDataSource.fetchChargers()
        assignmentResult = await self.assignmentAlgorithm.assign(trucks: trucks, chargers: chargers, availableHours: availableHours)
    }
}


