//
//  View.swift
//  View
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import SwiftUI

extension View {

    func fullScreen() -> some View {
        edgesIgnoringSafeArea(.horizontal)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
            .background(Color.white)
    }

    func asAnyView() -> AnyView {
        AnyView(self)
    }
}
