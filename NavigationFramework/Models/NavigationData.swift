//
//  NavigationData.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 12.10.2021.
//

import SwiftUI

protocol NavigationDataProtocol {
    var view: AnyView { get }
    var navigationBar: AnyView { get }
    var id: UUID { get }
    var hasNavigationBar: Bool { get }
}

struct NavigationData: NavigationDataProtocol {
    var id: UUID
    var view: AnyView
    var navigationBar: AnyView
    var hasNavigationBar: Bool
}
