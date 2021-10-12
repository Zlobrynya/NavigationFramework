//
//  NavigationViewModel.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import SwiftUI

public final class NavigationViewModel: ObservableObject, NavigationObserver {

    // MARK: - Internal properties

    @Published var stack: [TestModel] = []
    @Published var offset: CGFloat = 0 {
        didSet {
            let test = UIScreen.main.bounds.width * 0.7
            let test2 = ((offset / test) / 10)
            backgroundColor = Color.black.opacity(0.15 - test2)
        }
    }

    var opacity: CGFloat { 1 - (offset / UIScreen.main.bounds.width) }
    var backgroundColor = Color.white
    var shouldStartGesture = false

    // MARK: - Lifecycle

    public init() {}

    // MARK: - Internal functions

    func onAppear() {
        DiContainer.eventsManager.addObserver(self)
    }

    func onDisappear() {
        DiContainer.eventsManager.removeObserver(self)
    }

    // MARK: - Public functions

    func push<Content>(_ content: Content) where Content: TestView {

        let test = TestModel(view: content.asAnyView(), navigationBar: content.navigationBar, id: UUID())
        stack.append(test)

        print("🔵 \(stack)")
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

struct TestModel {
    var view: AnyView
    var navigationBar: NavigationBarView
    var id: UUID
}
