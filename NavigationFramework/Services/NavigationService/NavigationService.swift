//
//  NavigationService.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 10.10.2021.
//

import SwiftUI

public final class NavigationService {

    public var test: Int = 0
    
    // MARK: - External Dependencies

    private let eventsManager: EventsManagerProtocol

    // MARK: - Lifecycle

    init(eventsManager: EventsManagerProtocol = DiContainer.eventsManager) {
        self.eventsManager = eventsManager
    }

    // MARK: - Public functions

    public func push<Content>(_ content: Content) where Content: TestView {
        eventsManager.push(content)
        test += 1
    }
    
    public func pop() {
        eventsManager.pop()
        test -= 1
    }
}
