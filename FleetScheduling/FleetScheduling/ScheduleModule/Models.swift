import Foundation

protocol AssignmentAlgorithm  {
    func assign(trucks: [TruckModel],
                  chargers: [ChargerModel],
                  availableHours: Double) async -> AssignmentResult
}

struct AssignmentResult {
    let assignments: [AssignmentModel]
    let unscheduledTrucks: [TruckModel]
}

struct AssignmentModel: Identifiable {
    var id: UUID {
        charger.id
    }
    let charger: ChargerModel
    var truckAssignments: [TruckAssignment] = []
}

struct TruckAssignment: Identifiable {
    var id: UUID {
        truck.id
    }
    let truck: TruckModel
    let startTime: Date
    let endTime: Date
}
