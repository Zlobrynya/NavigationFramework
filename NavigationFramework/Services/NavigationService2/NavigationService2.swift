//
//  NavigationService2.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 03.10.2021.
//

import SwiftUI

public class NavigationService2 {
    public func push<Content>(_ content: Content) where Content: View {
        push(content.navigationBar(title: "push"))
    }

    public func push(_ content: () -> TupleView<(NavigationBarView, AnyView)>) {
        push(content())
    }

    public func push(_ content: TupleView<(NavigationBarView, AnyView)>) {}

    public func pop() {}
}
