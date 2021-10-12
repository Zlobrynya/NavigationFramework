//
//  NavigationBarView.swift
//  NavigationBarView
//
//  Created by Nikita Nikitin on 10.09.2021.
//

import SwiftUI

public struct NavigationBarView: View {

    // MARK: - Private properties

    @State private var isShowBackButton = false

    // MARK: - External Dependencies

    @Environment(\.stylingProvider) var stylingProvider
    @Environment(\.navigationService) var navigationService

    var title: String
    var tralingBarButton: (() -> AnyView)?
    var leadingBarButton: (() -> AnyView)?

    // MARK: - Lifecycle

    public init(title: String) {
        self.title = title
    }

    init<TrailingContent>(
        title: String,
        tralingBarButton: @escaping () -> TrailingContent
    ) where TrailingContent: View {
        self.title = title
        self.tralingBarButton = { tralingBarButton().asAnyView() }
    }

    init<LeadingContent>(
        title: String,
        leadingBarButton: @escaping () -> LeadingContent
    ) where LeadingContent: View {
        self.title = title
        self.leadingBarButton = { leadingBarButton().asAnyView() }
    }

    init<TrailingContent, LeadingContent>(
        title: String,
        tralingBarButton: @escaping () -> TrailingContent,
        leadingBarButton: @escaping () -> LeadingContent
    ) where TrailingContent: View, LeadingContent: View {
        self.title = title
        self.tralingBarButton = { tralingBarButton().asAnyView() }
        self.leadingBarButton = { leadingBarButton().asAnyView() }
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            backgoundStatusBar
            navigationBar
            Divider()
        }
    }

    // MARK: - Views

    private var backgoundStatusBar: some View {
        Rectangle()
            .fill(Color.defaultNavigationBarColor)
            .frame(height: stylingProvider.statusBarHeight)
    }

    private var navigationBar: some View {
        HStack {
            backButton
            Spacer()
            Text("\(title)")
            Spacer()
        }
        .frame(height: stylingProvider.navigationBarHeight)
        .background(Color.defaultNavigationBarColor)
    }

    // MARK: - Optional views

    private var backButton: AnyView? {
        guard navigationService.test != 0 else { return nil }
        return Button(
            action: {
                navigationService.pop()
            },
            label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .font(.body.bold())
                    .frame(width: 12, height: 20)
                    .padding(8)
            }
        ).asAnyView()
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Test")
    }
}
