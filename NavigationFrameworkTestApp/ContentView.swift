//
//  ContentView.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import NavigationFramework
import SwiftUI

struct ContentView: NavigationViewProtocol {

    // MARK: - Public properties

    @Environment(\.navigationService) var navigationService

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

    var navigationBar: () -> (NavigationBarView) {{
        NavigationBarView(title: "test")
    }}
}
