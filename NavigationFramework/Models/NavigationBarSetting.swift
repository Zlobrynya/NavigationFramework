//
//  NavigationBarSetting.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 16.10.2021.
//

import Foundation
import SwiftUI

public protocol NavigationBarSettingProtocol {
    /// Navigation backgound color.
    var backgoundColor: Color { get }

    /// Bunnot back color.
    var buttonBackColor: Color { get }

    /// Should hide diver.
    var shouldHideDivider: Bool { get }
}

public struct NavigationBarSetting: NavigationBarSettingProtocol {

    // MARK: - Public properties

    public var backgoundColor: Color
    public var buttonBackColor: Color
    public var shouldHideDivider: Bool

    // MARK: - Lifecycle

    public init(
        backgoundColor: Color = Color.defaultNavigationBarColor,
        buttonBackColor: Color = Color.backgroundNavigationBack,
        shouldHideDivider: Bool = false
    ) {
        self.backgoundColor = backgoundColor
        self.buttonBackColor = buttonBackColor
        self.shouldHideDivider = shouldHideDivider
    }
}
