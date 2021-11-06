//
//  DefaultAnimatableModifier.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 05.11.2021.
//

import SwiftUI

public struct DefaultAnimatableModifier: AnimatableModifier {
    
    // MARK: - Public Properties

    public var animatableData: CGFloat {
        get { offset }
        set { offset = newValue }
    }

    // MARK: - Private Properties

    private var offset: CGFloat

    // MARK: - Lifecycle

    public init(offset: CGFloat) {
        self.offset = offset
    }

    // MARK: - Body

    public func body(content: Content) -> some View {
        content.offset(x: animatableData)
    }
}
