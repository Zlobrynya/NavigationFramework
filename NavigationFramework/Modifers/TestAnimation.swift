//
//  TestAnimation.swift
//  TestAnimation
//
//  Created by Nikita Nikitin on 10.09.2021.
//

import SwiftUI

public struct TestViewModifier: ViewModifier {

    public func body(content: Content) -> some View {
        NavigationBarView(text: "Test")
        Text("")
    }
}
