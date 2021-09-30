//
//  NavigationBarView.swift
//  NavigationBarView
//
//  Created by Nikita Nikitin on 10.09.2021.
//

import SwiftUI

public struct NavigationBarView: View {
    
    @Environment(\.stylingProvider) var stylingProvider

    var title: String
    
    public var body: some View {
        VStack(spacing: 0) {
            Rectangle().fill(Color.defaultNavigationBarColor).frame(height: stylingProvider.statusBarHeight)
            HStack {
                Spacer()
                Text("\(title)")
                Spacer()
            }
            .frame(height: stylingProvider.navigationBarHeight)
            .background(Color.defaultNavigationBarColor)
            Divider()
        }
    }

}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Test")
    }
}
