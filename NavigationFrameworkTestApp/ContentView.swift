//
//  ContentView.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import NavigationFramework
import SwiftUI

struct ContentView: TestView {
    var navigationBar: NavigationBarView {
        NavigationBarView(title: "test")
    }

    // MARK: - Public properties

    @Environment(\.navigationService) var navigationService
//    @EnvironmentObject var navigationService: NavigationViewModel

    // MARK: - Body

    var body: some View {
        VStack {
            Text("ContentView")
            Button(
                action: { navigationService.push(NextScreen()) },
                label: { Text("Add new screen") }
            )
        }
    }
}
