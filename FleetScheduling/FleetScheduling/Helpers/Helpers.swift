import Foundation

public struct DoubleFormatter {
    public static let twoDecimalPlaces: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    public static func format(_ value: Double) -> String {
        return twoDecimalPlaces.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

