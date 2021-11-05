//
//  CustomNavigationView.swift
//  NavigationView
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import SwiftUI

public struct CustomNavigationView<Content, Animatable>: View
    where Content: NavigationViewProtocol, Animatable: AnimatableModifier {

    // MARK: - External Dependencies

    @Environment(\.stylingProvider) var stylingProvider
    
    @StateObject var navigationService = NavigationViewModel()
    @ViewBuilder private var firstScreen: () -> Content
    private var animation: (CGFloat) -> Animatable

    // MARK: - Lifecycle
    
    public init(firstScreen: @escaping () -> Content) where Animatable == DefaultAnimatableModifier {
        self.init(animatable: { DefaultAnimatableModifier(offset: $0) }, firstScreen: firstScreen)
    }
    
    public init(animatable: @escaping (CGFloat) -> Animatable, firstScreen: @escaping () -> Content) {
        self.firstScreen = firstScreen
        self.animation = animatable
    }

    // MARK: - Body

    public var body: some View {
        ZStack(alignment: .leading) {
            ForEach(Array(navigationService.stack.enumerated()), id: \.offset) { index, element in
                view(forItem: element, withIndex: index)
            }
            rectangleDefiningGestures
        }
        .fullScreen()
        .onAppear { navigationService.onAppear(with: firstScreen()) }
        .onDisappear { navigationService.onDisappear() }
    }

    // MARK: - Views

    @ViewBuilder
    private func view(forItem item: NavigationDataProtocol, withIndex index: Int) -> some View {
        let isLast = navigationService.stack.isLast(forId: item.id)
        VStack(spacing: 0) {
            item.navigationBar.opacity(isLast ? navigationService.opacity : 1)
            item.view.fullScreen()
//                .offset(x: isLast ? navigationService.offset : 0)
                .overlay(isLast ? nil : overlayPreviousScreens)
                .modifier(animation(isLast ? navigationService.offset : 0))
        }
    }

    private var overlayPreviousScreens: AnyView? {
        guard navigationService.stack.count > 1 else { return nil }
        return AnyView(navigationService.backgroundColor)
    }

    private var rectangleDefiningGestures: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(width: 5)
            .contentShape(Rectangle())
            .simultaneousGesture(
                DragGesture()
                    .onChanged {
                        guard navigationService.stack.count > 1 else { return }
                        if navigationService.shouldStartGesture {
                            navigationService.offset = $0.location.x
                        } else if $0.startLocation.x < 25 {
                            navigationService.shouldStartGesture = true
                        }
                    }
                    .onEnded {
                        guard navigationService.shouldStartGesture else { return }
                        defer {
                            navigationService.shouldStartGesture = false
                        }
                        if $0.location.x > (UIScreen.main.bounds.width * 0.7) {
                            navigationService.pop()
                        } else {
                            withAnimation(Animation.linear(duration: 0.2)) {
                                navigationService.offset = 0
                            }
                        }
                    }
            )
    }
}

// struct NavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            Test()
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//
//    struct Test: NavigationViewProtocol {
//        var body: some View {
//            Text("Test")
//        }
//
//        var navigationBar: View? {
//            nil
//        }
//    }
// }
