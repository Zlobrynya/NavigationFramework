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
    @State var shouldSheetScreen = false

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
            Button(action: { shouldSheetScreen = true }, label: { Text("Open sheet screen") })
        }.sheet(isPresented: $shouldSheetScreen, content: { NewSheetScreen() })
    }
    

    var navigationBar: some View {
        NavigationBarView(
            title: "TESTTTTEE",
            leadingBarButton: { Image(systemName: "trash.slash") },
            trailingBarButton: { Image(systemName: "trash") }
        )
    }
    
    
//    var navigationBar: NavigationBar? {
//        NavigationBarView(
//            title: "TESTTTTEE",
//            leadingBarButton: { Image(systemName: "trash.slash") },
//            trailingBarButton: { Image(systemName: "trash") }
//        )
//    }
}

struct NextScreen_Previews: PreviewProvider {
    static var previews: some View {
        NextScreen()
    }
}
