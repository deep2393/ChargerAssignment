import Foundation
 
struct ChargerModel: Identifiable, Codable {
    let id: UUID
    var name: String
    var maxKW: Double
}
