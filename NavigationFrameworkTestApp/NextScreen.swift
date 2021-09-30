//
//  NextScreen.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 30.09.2021.
//

import SwiftUI
import NavigationFramework

struct NextScreen: View {
    @EnvironmentObject var navigationService: NavigationService
    @State var count = 0

    var body: some View {
        VStack {
            Text("New screen with count \(count)")
            Button(
                action: { navigationService.pop() },
                label: { Text("Pop") }
            )
            Button(
                action: { navigationService.push(NextScreen()) },
                label: { Text("New screen") }
            )
            Button(action: { count += 1 }, label: { Text("New screen") })
        }.navigationBar(title: "new screen")
    }
}

struct NextScreen_Previews: PreviewProvider {
    static var previews: some View {
        NextScreen()
    }
}