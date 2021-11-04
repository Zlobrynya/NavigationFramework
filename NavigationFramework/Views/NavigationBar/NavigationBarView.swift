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

    // MARK: - Lifecycle

    public init(title: String) {
        self.init(title: { Text(title) })
    }

    public init<TitleContent>(title: @escaping () -> TitleContent) where TitleContent: View {
        self.title = { title().asAnyView() }
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            navigationBar
                .background(backgroundStatusBar)
            divider
        }
        .background(navigationBarSetting.backgroundColor)
    }

    // MARK: - Views

    private var backgroundStatusBar: some View {
        Rectangle()
            .fill(navigationBarSetting.backgroundColor)
            .frame(height: stylingProvider.statusBarHeight)
            .offset(y: -stylingProvider.statusBarHeight + 2)
    }

    private var navigationBar: some View {
        ZStack(alignment: .leading) {
            backButton
            titleView
        }
        .frame(height: stylingProvider.navigationBarHeight)
    }

    private var titleView: some View {
        HStack {
            Spacer()
            title()
            Spacer()
        }
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

// MARK: - Extension NavigationBarView

public extension NavigationBarView {

    ///  Add `trailing bar item` in navigation bar.
    ///
    /// - Parameter leading: A view that appears on the leading edge of the title.
    /// - Parameter trailing: A view that appears on the trailing edge of the title.
    /// - Returns: Navigation bar with trailing views.
    func navigationItems<TrailingContent>(trailing: @escaping () -> TrailingContent) -> some View where TrailingContent: View {
        navigationItems(leading: { EmptyView() }, trailing: trailing)
    }

    ///  Add `leading bar item` in navigation bar.
    ///
    /// - Parameter leading: A view that appears on the leading edge of the title.
    /// - Parameter trailing: A view that appears on the trailing edge of the title.
    /// - Returns: Navigation bar with leading views.
    func navigationItems<LeadingContent>(leading: @escaping () -> LeadingContent) -> some View where LeadingContent: View {
        navigationItems(leading: leading, trailing: { EmptyView() })
    }

    ///  Add `leading bar item` and `trailing bar item` in navigation bar.
    ///
    /// - Parameter leading: A view that appears on the leading edge of the title.
    /// - Parameter trailing: A view that appears on the trailing edge of the title.
    /// - Returns: Navigation bar with leading and trailing views.
    func navigationItems<LeadingContent, TrailingContent>(
        leading: @escaping () -> LeadingContent,
        trailing: @escaping () -> TrailingContent
    ) -> some View where LeadingContent: View, TrailingContent: View {
        modifier(NavigationButtonsModifier(leadingBarButton: leading, trailingBarButton: trailing))
    }
}
