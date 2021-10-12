//
//  EventsManager.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 10.10.2021.
//

import Foundation
import SwiftUI

protocol EventObserverProtocol: AnyObject {}

protocol NavigationObserver: EventObserverProtocol {
    func pop()
    func push<Content>(_ content: Content) where Content: NavigationViewProtocol
}

protocol EventsManagerProtocol: NavigationObserver {
    func addObserver(_ observer: EventObserverProtocol)
    func removeObserver(_ observer: EventObserverProtocol)
}

final class EventsManager: EventsManagerProtocol {
    
    // MARK: - External Dependencies
    
    private let observersAccessQueue: DispatchQueue
    private var observersTable: NSHashTable<AnyObject>
    
    // MARK: - Lifecycle
    
    init(
        observersAccessQueue: DispatchQueue = DispatchQueue(
            label: "Test",
            attributes: .concurrent
        ),
        observersTable: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    ) {
        self.observersAccessQueue = observersAccessQueue
        self.observersTable = observersTable
    }
    
    // MARK: - Public properties
    
    func addObserver(_ observer: EventObserverProtocol) {
        observersAccessQueue.async(flags: .barrier) { self.observersTable.add(observer) }
    }

    func removeObserver(_ observer: EventObserverProtocol) {
        observersAccessQueue.async(flags: .barrier) { self.observersTable.remove(observer) }
    }
    
    // MARK: - NavigationObserver Conformance
    
    func pop() {
        observersAccessQueue.sync {
            observersTable.allObjects
                .compactMap { $0 as? NavigationObserver }
                .forEach { $0.pop() }
        }
    }
    
    func push<Content>(_ content: Content) where Content: NavigationViewProtocol {
        observersAccessQueue.sync {
            observersTable.allObjects
                .compactMap { $0 as? NavigationObserver }
                .forEach { $0.push(content) }
        }
    }
}
