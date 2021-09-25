//
//  NavigationBarView.swift
//  NavigationBarView
//
//  Created by Nikita Nikitin on 10.09.2021.
//

import SwiftUI

public struct NavigationBarView: View {
    
    var text: String
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("NavigationBarView \(text)")
                Spacer()
            }
            .frame(height: 88)
            .background(Color.secondary)
            Spacer()
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(text: "Test")
    }
}
