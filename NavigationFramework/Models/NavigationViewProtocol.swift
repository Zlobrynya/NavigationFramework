//
//  NavigationView.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 12.10.2021.
//

import SwiftUI

public protocol NavigationViewProtocol: View {

    ///  <#Description#>
    associatedtype NavigationBar: View

    ///  <#Description#>
    @ViewBuilder var navigationBar: Self.NavigationBar { get }
}

public extension NavigationViewProtocol {
    var navigationBar: some View {
        EmptyView()
    }
}
