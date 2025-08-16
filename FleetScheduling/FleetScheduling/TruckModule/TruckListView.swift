import SwiftUI

public struct TruckListView: View, AppScreen {
    // MARK: AppScreen prococol confirmance
    var title: String {
        "Trucks"
    }
    
    var contentView: AnyView {
        AnyView(self)
    }

    // MARK: Body methods
    @StateObject private var viewModel = TruckListViewModel()
    
    public var body: some View {
        List(viewModel.trucks) {
            TruckView(model: $0)
        }
        .listStyle(.plain)
        .task {
            await viewModel.fetchTrucks()
        }
    }
}

struct TruckView: View {
    let model: TruckModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text("Truck:")
                    .fontWeight(.semibold)
                Text(model.name)
            }

            HStack(spacing: 8) {
                Text("Battery:")
                    .fontWeight(.semibold)
                Text("\(DoubleFormatter.format(model.batteryLevel))%")
            }

            HStack(spacing: 8) {
                Text("Charge Rate:")
                    .fontWeight(.semibold)
                Text("\(DoubleFormatter.format(model.kwPerhour)) kW/h")
            }
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
