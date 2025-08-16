//
//  AppContainer.swift
//  FleetScheduling
//
//  Created by Deepak Singh on 16/08/25.
//
import SwiftUI

protocol AppContainer {
    func makeContainer() -> AnyView
}


protocol AppScreen {
    var title: String { get }
    var contentView: AnyView { get }
}
