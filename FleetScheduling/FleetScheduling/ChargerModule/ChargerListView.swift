import SwiftUI

public struct ChargerListView: View, AppScreen {
    // MARK: AppScreen prococol confirmance
    var title: String {
        "Chargers"
    }
    
    var contentView: AnyView {
        AnyView(self)
    }

    // MARK: Body methods
    @StateObject private var viewModel = ChargerListViewModel()
    
    public var body: some View {
        List(viewModel.chargers) {
            ChargerView(model: $0)
        }
        .listStyle(.plain)
    }
}

struct ChargerView: View {
    let model: ChargerModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Text("Charger:")
                    .fontWeight(.semibold)
                Text(model.name)
            }
            
            HStack(spacing: 8) {
                Text("Max Power:")
                    .fontWeight(.semibold)
                Text("\(DoubleFormatter.format(model.maxKW)) kW")
            }
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
