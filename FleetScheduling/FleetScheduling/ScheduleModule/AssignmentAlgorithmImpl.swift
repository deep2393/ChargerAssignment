import Foundation

class AssignmentAlgorithmImpl: AssignmentAlgorithm {
    func assign(
        trucks: [TruckModel],
        chargers: [ChargerModel],
        availableHours: Double
    ) async -> AssignmentResult {
        
        let totalAvailableTime = availableHours * 3600 // hours → seconds
        let now = Date()
        
        var chargerAssignments = chargers.map { AssignmentModel(charger: $0) }
        var unscheduled: [TruckModel] = []
        
        for truck in trucks {
            var scheduled = false
            
            for i in 0 ..< chargerAssignments.count {
                let charger = chargerAssignments[i].charger
                let chargingRate = charger.maxKW
                
                guard chargingRate > 0 else { continue } // skip invalid chargers
                
                let timeToChargeSeconds = (truck.energyNeeded / chargingRate) * 3600
                
                let lastEndTime = chargerAssignments[i].truckAssignments.last?.endTime ?? now
                let newEndTime = lastEndTime.addingTimeInterval(timeToChargeSeconds)
                
                if newEndTime.timeIntervalSince(now) <= totalAvailableTime {
                    let assignment = TruckAssignment(
                        truck: truck,
                        startTime: lastEndTime,
                        endTime: newEndTime
                    )
                    chargerAssignments[i].truckAssignments.append(assignment)
                    scheduled = true
                    break
                }
            }
            
            if !scheduled {
                unscheduled.append(truck)
            }
        }
        
        return AssignmentResult(
            assignments: chargerAssignments,
            unscheduledTrucks: unscheduled
        )
    }
}

