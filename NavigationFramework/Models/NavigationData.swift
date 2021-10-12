//
//  NavigationData.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 12.10.2021.
//

import SwiftUI

protocol NavigationDataProtocol {
    var view: AnyView { get }
    var navigationBar: NavigationBarView { get }
    var id: UUID { get }
}

struct NavigationData: NavigationDataProtocol {
    var view: AnyView
    var navigationBar: NavigationBarView
    var id: UUID
}
