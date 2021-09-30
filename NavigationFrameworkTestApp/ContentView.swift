//
//  ContentView.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import NavigationFramework
import SwiftUI

struct ContentView: View {

    // MARK: - Public properties

    @EnvironmentObject var navigationService: NavigationService

    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                Text("ContentView")
                Button(
                    action: { navigationService.push(NextScreen()) },
                    label: { Text("Add new screen") }
                )
            }
        }
    }
}
