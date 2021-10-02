//
//  NavigationView.swift
//  NavigationView
//
//  Created by Nikita Nikitin on 04.09.2021.
//

import SwiftUI

public struct NavigationView<Content>: View where Content: View {

    @EnvironmentObject var navigationService: NavigationService
    @Environment(\.stylingProvider) var stylingProvider

    // MARK: - Private properties

    @ViewBuilder private var firstScreen: () -> Content

    // MARK: - Lifecycle

    public init(firstScreen: @escaping () -> Content) {
        self.firstScreen = firstScreen
    }

    public var body: some View {
        ZStack {
            ForEach(navigationService.stack, id: \.id) {
                view(forItem: $0)
            }
        }
        .fullScreen()
        .onAppear {
            navigationService.push(firstScreen().navigationBar(title: "Second"))
        }
        .gesture(
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

    // MARK: - Views

    @ViewBuilder
    private func view(forItem item: TestModel) -> some View {
        let isLast = navigationService.stack.isLast(forId: item.id)
        item.view.value.1
            .fullScreen()
            .offset(x: isLast ? navigationService.offset : 0)
            .overlay(isLast ? nil : overlayPreviousScreens)
            .padding(.top, stylingProvider.navigationBarHeight + stylingProvider.statusBarHeight)
        VStack {
            item.view.value.0.opacity(isLast ? navigationService.opacity : 1)
            Spacer()
        }
    }

    private var overlayPreviousScreens: AnyView? {
        guard navigationService.stack.count > 1 else { return nil }
        return AnyView(navigationService.backgroundColor)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Test")
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(NavigationService())
    }
}
