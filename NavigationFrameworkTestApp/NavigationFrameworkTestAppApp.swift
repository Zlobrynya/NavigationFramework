//
//  NavigationFrameworkTestAppApp.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import NavigationFramework
import SwiftUI

@main
struct NavigationFrameworkTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            CustomNavigationView {
                ContentView()
            }
        }
    }
}
