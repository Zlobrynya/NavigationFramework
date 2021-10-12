//
//  NavigationStackCount.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 12.10.2021.
//

import Foundation
protocol NavigationStackCountProtocol {
    var count: Int { get }
    func updateValue(_ count: Int)
}

class NavigationStackCount: NavigationStackCountProtocol {

    // MARK: - Public properties

    private(set) var count: Int

    // MARK: - Lifecycle

    init(count: Int = 0) {
        self.count = count
    }
    
    // MARK: - Public functions

    func updateValue(_ count: Int) {
        self.count = count
    }
}
