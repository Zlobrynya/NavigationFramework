//
//  StylingProvider.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 30.09.2021.
//

import Foundation
import UIKit

protocol StylingProviderProtocol {
    var navigationBarHeight: CGFloat { get }
    var navigationButtonSize: CGFloat { get }
    var statusBarHeight: CGFloat { get }
}

struct StylingProvider: StylingProviderProtocol {

    var navigationBarHeight: CGFloat = 44
    var navigationButtonSize: CGFloat = 28

    var statusBarHeight: CGFloat {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}
