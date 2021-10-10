//
//  NavigationService.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 10.10.2021.
//

import SwiftUI

public final class NavigationService {

    // MARK: - External Dependencies

    private let eventsManager: EventsManagerProtocol

    // MARK: - Lifecycle

    init(eventsManager: EventsManagerProtocol = DiContainer.eventsManager) {
        self.eventsManager = eventsManager
    }

    // MARK: - Public functions

    public func push<Content>(_ content: Content) where Content: TestView {
//        if content.body is TupleView<(NavigationBarView, AnyView)> {
        eventsManager.push(content)
//        } else {
//            push(content.navigationBar(title: ""))
//        }
    }

//    public func push(_ content: TupleView<(NavigationBarView, AnyView)>) {
//        eventsManager.push { content }
//    }

    public func pop() {
        eventsManager.pop()
    }
}
