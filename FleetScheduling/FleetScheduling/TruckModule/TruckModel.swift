import Foundation

struct TruckModel: Identifiable, Decodable {
    let id: UUID
    var name: String
    var batteryLevel: Double
    var kwPerhour: Double
    var maxCapacity: Double = 100.0

    var energyNeeded: Double {
        max(0, maxCapacity - batteryLevel)
    }
}
