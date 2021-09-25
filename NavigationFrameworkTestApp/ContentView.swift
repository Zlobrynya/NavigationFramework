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
                    action: { navigationService.push(newScreen) },
                    label: { Text("Add new screen") }
                )
            }
        }
    }

    // MARK: - Views

    private var newScreen: some View {
        let test = VStack {
            Text("New screen")
            Button(
                action: { navigationService.pop() },
                label: { Text("Pop") }
            )
            Button(
                action: { navigationService.push(self.newScreen) },
                label: { Text("New screen") }
            )
        }.navigationBar(title: "new screen")
        return test
    }
}
