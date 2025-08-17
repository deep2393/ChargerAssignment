import Foundation

struct DoubleFormatter {
    private let twoDecimalPlaces: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    func format(_ value: Double) -> String {
        return twoDecimalPlaces.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

