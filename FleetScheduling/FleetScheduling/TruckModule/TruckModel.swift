import Foundation

struct TruckModel: Identifiable, Decodable {
    let id: UUID
    var name: String
    var batteryLevel: Double
    var batteryCapacity: Double
    
    var energyNeeded: Double {
        max(0, (100 - batteryLevel)/100 * batteryCapacity)
    }
}
