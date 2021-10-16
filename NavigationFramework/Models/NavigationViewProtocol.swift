//
//  NavigationView.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 12.10.2021.
//

import SwiftUI

public protocol NavigationViewProtocol: View {
    var navigationBar: () -> (NavigationBarView) { get }
}
