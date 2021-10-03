//
//  EnvironmentValues.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 30.09.2021.
//

import SwiftUI

extension EnvironmentValues {
    var stylingProvider: StylingProviderProtocol { self[StylingProviderKey.self] }
}
