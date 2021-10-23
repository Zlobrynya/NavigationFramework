//
//  NewSheetScreen.swift
//  NavigationFrameworkTestApp
//
//  Created by Nikita Nikitin on 23.10.2021.
//

import SwiftUI
import NavigationFramework

struct NewSheetScreen: View {
    var body: some View {
        CustomNavigationView {
            NextScreen()
        }
    }
}

struct NewSheetScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewSheetScreen()
    }
}
