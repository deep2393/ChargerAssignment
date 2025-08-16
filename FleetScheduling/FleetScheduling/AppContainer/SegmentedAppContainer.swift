import SwiftUI

struct SegmentedAppContainer: View, AppContainer {
    func makeContainer() -> AnyView {
        AnyView(self)
    }
    
    @State private var selectedSegment = 0
    let segments: [AppScreen]

    var body: some View {
        VStack {
            Picker("Picker", selection: $selectedSegment) {
                ForEach(0..<segments.count, id: \.self) { index in
                    Text(segments[index].title).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            segments[selectedSegment].contentView
        }
    }
    
    func makeContainer() -> SegmentedAppContainer {
        self
    }
}
