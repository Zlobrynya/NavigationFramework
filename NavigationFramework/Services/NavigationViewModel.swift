//
//  NavigationViewModel.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import SwiftUI

final class NavigationViewModel: ObservableObject, NavigationObserver {

    // MARK: - Public properties

    @Published var stack: [NavigationDataProtocol] = [] {
        didSet { navigationStackCount.updateValue(stack.count) }
    }

    @Published var offset: CGFloat = 0 {
        didSet {
            let bounds = UIScreen.main.bounds.width * 0.7
            let calculatedTransparency = ((offset / bounds) / 10)
            backgroundColor = Color.black.opacity(0.15 - calculatedTransparency)
        }
    }

    var opacity: CGFloat { 1 - (offset / UIScreen.main.bounds.width) }
    var backgroundColor = Color.white
    var shouldStartGesture = false

    // MARK: - External Dependencies

    @Environment(\.navigationStackCount) var navigationStackCount
    private var eventsManager: EventsManagerProtocol

    // MARK: - Lifecycle

    init(eventsManager: EventsManagerProtocol = DiContainer.eventsManager) {
        self.eventsManager = eventsManager
    }

    func onAppear<Content>(with firstScreen: Content) where Content: NavigationViewProtocol {
        eventsManager.addObserver(self)
        push(firstScreen)
    }

    func onDisappear() {
        eventsManager.removeObserver(self)
    }

    // MARK: - Public functions

    func push<Content>(_ content: Content) where Content: NavigationViewProtocol {
        let content = NavigationData(view: content.asAnyView(), navigationBar: content.navigationBar(), id: UUID())
        stack.append(content)
        guard stack.count > 1 else { return }
        offset = UIScreen.main.bounds.width
        withAnimation {
            self.offset = 0
        }
    }

    public func pop() {
        guard stack.count > 1 else { return }
        animationPop {
            self.stack.removeLast()
        }
    }

    // MARK: - Private functions

    private func animationPop(complited: @escaping () -> Void) {
        withAnimation(Animation.linear(duration: 0.2)) {
            offset = UIScreen.main.bounds.width
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
            complited()
            self.offset = 0
        }
    }
}
