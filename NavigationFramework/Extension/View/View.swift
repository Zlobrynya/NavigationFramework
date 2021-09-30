//
//  View.swift
//  View
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import SwiftUI

extension View {

    func fullScreen() -> some View {
        edgesIgnoringSafeArea(.all)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
            .background(Color.white)
    }

}

public extension View {
    @ViewBuilder
    func navigationBar(title: String) -> TupleView<(NavigationBarView, AnyView)> {
        NavigationBarView(title: title)
        AnyView(self)
    }
}
