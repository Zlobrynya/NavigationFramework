//
//  NavigationBarSetting.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 16.10.2021.
//

import Foundation
import SwiftUI

public protocol NavigationBarSettingProtocol {
    /// Navigation background color.
    var backgroundColor: Color { get }

    /// Button back color.
    var buttonBackColor: Color { get }

    /// Should hide diver under navigation bar.
    var shouldHideDivider: Bool { get }
}

public struct NavigationBarSetting: NavigationBarSettingProtocol {

    // MARK: - Public properties

    public var backgroundColor: Color
    public var buttonBackColor: Color
    public var shouldHideDivider: Bool

    // MARK: - Lifecycle

    public init(
        backgoundColor: Color = Color.defaultNavigationBarColor,
        buttonBackColor: Color = Color.backgroundNavigationBack,
        shouldHideDivider: Bool = false
    ) {
        self.backgroundColor = backgoundColor
        self.buttonBackColor = buttonBackColor
        self.shouldHideDivider = shouldHideDivider
    }
}
