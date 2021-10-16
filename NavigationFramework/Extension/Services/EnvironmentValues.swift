//
//  EnvironmentValues.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 30.09.2021.
//

import SwiftUI

public extension EnvironmentValues {

    // MARK: - Public properties

    var navigationService: NavigationService { self[NavigationServiceKey.self] }

    var navigationBarSetting: NavigationBarSettingProtocol {
        get { self[NavigationBarSettingKey.self] }
        set { self[NavigationBarSettingKey.self] = newValue }
    }
    
    // MARK: - Internal properties

    internal var stylingProvider: StylingProviderProtocol { self[StylingProviderKey.self] }

    internal var navigationStackCount: NavigationStackCount { self[NavigationStackCountKey.self] }
}
