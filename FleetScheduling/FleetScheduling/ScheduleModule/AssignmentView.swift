import SwiftUI

public struct AssignmentListView: View, AppScreen {
    // MARK: Protocol conformance
    var title: String {
        "Assignment"
    }
    var contentView: AnyView {
        AnyView(self)
    }
    
    // MARK: View Protocol conformance
    @StateObject var viewModel = AssignmentViewModel()
    
    public var body: some View {
        VStack {
            List() {
                Text("✅ Assignments:")
                    .font(.headline)
                ForEach(viewModel.assignmentResult.assignments) {
                    AssignmentView(model: $0)
                }
                Text("❌ Unassigned trucks:")
                    .font(.headline)
                ForEach(viewModel.assignmentResult.unscheduledTrucks) {
                    TruckView(model: $0)
                }
            }
            Text("Select time:")
                .font(.headline)
            TimePickerView(selectedTime: $viewModel.availableHours)
                .frame(height: 150)
        }.task {
            await viewModel.loadAssignments()
        }
    }
}


struct AssignmentView: View {
    let model: AssignmentModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Charger: \(model.charger.name) (\(DoubleFormatter().format(model.charger.maxKW))kW)")
                .font(.headline)
            ForEach(model.truckAssignments) { truckAssignment in
                Text("----------------------")
                HStack(spacing: 6) {
                    Text("Truck:")
                        .fontWeight(.semibold)
                    Text(truckAssignment.truck.name)
                }
                
                HStack(spacing: 6) {
                    Text("Start:")
                        .fontWeight(.semibold)
                    Text(truckAssignment.startTime.formatted(date: .omitted, time: .shortened))
                }
                
                HStack(spacing: 6) {
                    Text("End:")
                        .fontWeight(.semibold)
                    Text(truckAssignment.endTime.formatted(date: .omitted, time: .shortened))
                }
            }
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
