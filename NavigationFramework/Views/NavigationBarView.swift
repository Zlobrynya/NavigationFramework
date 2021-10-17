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

    @Environment(\.stylingProvider) private var stylingProvider
    @Environment(\.navigationService) private var navigationService
    @Environment(\.navigationStackCount) private var navigationStackCount
    @Environment(\.navigationBarSetting) private var navigationBarSetting

    private var title: () -> AnyView
    private var tralingBarButton: () -> AnyView
    private var leadingBarButton: () -> AnyView

    // MARK: - Lifecycle

    public init(title: String) {
        self.init(
            title: { Text(title) },
            leadingBarButton: { EmptyView() },
            tralingBarButton: { EmptyView() }
        )
    }

    public init<TitleContent>(title: @escaping () -> TitleContent) where TitleContent: View {
        self.init(
            title: title,
            leadingBarButton: { EmptyView() },
            tralingBarButton: { EmptyView() }
        )
    }

    public init<TrailingContent>(
        title: String,
        tralingBarButton: @escaping () -> TrailingContent
    ) where TrailingContent: View {
        self.init(
            title: { Text(title) },
            leadingBarButton: { EmptyView() },
            tralingBarButton: tralingBarButton
        )
    }

    public init<TitleContent, TrailingContent>(
        title: @escaping () -> TitleContent,
        tralingBarButton: @escaping () -> TrailingContent
    ) where TrailingContent: View, TitleContent: View {
        self.init(
            title: title,
            leadingBarButton: { EmptyView() },
            tralingBarButton: tralingBarButton
        )
    }

    public init<LeadingContent>(
        title: String,
        leadingBarButton: @escaping () -> LeadingContent
    ) where LeadingContent: View {
        self.init(
            title: { Text(title) },
            leadingBarButton: leadingBarButton,
            tralingBarButton: { EmptyView() }
        )
    }

    public init<LeadingContent, TitleContent>(
        title: @escaping () -> TitleContent,
        leadingBarButton: @escaping () -> LeadingContent
    ) where LeadingContent: View, TitleContent: View {
        self.init(
            title: title,
            leadingBarButton: leadingBarButton,
            tralingBarButton: { EmptyView() }
        )
    }
    
    public init<LeadingContent, TrailingContent>(
        title: String,
        leadingBarButton: @escaping () -> LeadingContent,
        tralingBarButton: @escaping () -> TrailingContent
    ) where LeadingContent: View, TrailingContent: View {
        self.init(
            title: { Text(title) },
            leadingBarButton: leadingBarButton,
            tralingBarButton: tralingBarButton
        )
    }

    public init<LeadingContent, TitleContent, TrailingContent>(
        title: @escaping () -> TitleContent,
        leadingBarButton: @escaping () -> LeadingContent,
        tralingBarButton: @escaping () -> TrailingContent
    ) where LeadingContent: View, TitleContent: View, TrailingContent: View {
        self.title = { title().asAnyView() }
        self.tralingBarButton = { tralingBarButton().asAnyView() }
        self.leadingBarButton = { leadingBarButton().asAnyView() }
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            backgoundStatusBar
            navigationBar
            divider
        }
    }

    // MARK: - Views

    private var backgoundStatusBar: some View {
        Rectangle()
            .fill(navigationBarSetting.backgroundColor)
            .frame(height: stylingProvider.statusBarHeight)
    }

    private var navigationBar: some View {
        ZStack(alignment: .leading) {
            buttons
            titleView
        }
        .frame(height: stylingProvider.navigationBarHeight)
        .background(navigationBarSetting.backgroundColor)
    }

    private var titleView: some View {
        HStack {
            Spacer()
            title()
            Spacer()
        }
    }

    private var buttons: some View {
        HStack(spacing: 4) {
            backButton
            leadingBarButton()
                .frame(width: stylingProvider.navigationButtonSize, height: stylingProvider.navigationButtonSize)
                .padding(3)
            Spacer()
            tralingBarButton()
                .frame(width: stylingProvider.navigationButtonSize, height: stylingProvider.navigationButtonSize)
                .padding(3)
        }.padding(.horizontal, 8)
    }

    // MARK: - Optional views

    private var divider: AnyView? {
        guard !navigationBarSetting.shouldHideDivider else { return nil }
        return Divider().asAnyView()
    }

    private var backButton: AnyView? {
        guard navigationStackCount.count > 1 else { return nil }
        return Button(
            action: { navigationService.pop() },
            label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .font(.body.weight(.medium))
                    .frame(width: 12, height: 20)
            }
        )
        .foregroundColor(navigationBarSetting.buttonBackColor)
        .asAnyView()
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Test")
    }
}
