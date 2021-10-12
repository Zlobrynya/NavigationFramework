//
//  NextScreen.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 30.09.2021.
//

import NavigationFramework
import SwiftUI

struct NextScreen: NavigationViewProtocol {

    @Environment(\.navigationService) var navigationService

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
            Button(action: { count += 1 }, label: { Text("Count") })
        }.navigationBar(title: "new screen")
    }

    var navigationBar: NavigationBarView {
        NavigationBarView(title: "TESTTTTEE")
    }
}

struct NextScreen_Previews: PreviewProvider {
    static var previews: some View {
        NextScreen()
    }
}
