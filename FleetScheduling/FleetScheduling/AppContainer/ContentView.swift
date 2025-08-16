//
//  ContentView.swift
//  FleetScheduling
//
//  Created by Deepak Singh on 14/08/25.
//

import SwiftUI

struct ContentView: View {
    let appContainer: AppContainer
    
    init(appContainer: AppContainer = SegmentedAppContainer(
            segments: AppScreenFactory().appScreens)) {
        self.appContainer = appContainer
    }

    var body: some View {
       appContainer.makeContainer()
    }
}

struct AppScreenFactory {
    var appScreens: [AppScreen] {
        return [AssignmentListView(), TruckListView(), ChargerListView()]
    }
}
