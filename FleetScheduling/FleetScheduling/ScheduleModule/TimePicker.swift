import SwiftUI

struct TimePickerView: View {
    @Binding var selectedTime: Double
    
    var body: some View {
        Picker("Select Time", selection: $selectedTime) {
            ForEach(0...8, id: \.self) { value in
                Text("\(value) h")
                    .tag(Double(value))
            }
        }
        .pickerStyle(.wheel) // You can change to .menu or .segmented if you like
    }
}
