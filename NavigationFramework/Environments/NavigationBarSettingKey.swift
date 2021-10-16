//
//  NavigationBarSettingKey.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 16.10.2021.
//

import Foundation
import SwiftUI

public struct NavigationBarSettingKey: EnvironmentKey {
    public static let defaultValue: NavigationBarSettingProtocol = NavigationBarSetting()
}
