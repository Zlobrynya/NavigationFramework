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
    @Environment(\.navigationStackCount) var navigationStackCount
    @Environment(\.navigationBarSetting) var navigationBarSetting

    var title: String
    var tralingBarButton: (() -> AnyView)?
    var leadingBarButton: (() -> AnyView)?

    // MARK: - Lifecycle

    public init(title: String) {
        self.title = title
    }

    public init<TrailingContent>(
        title: String,
        tralingBarButton: @escaping () -> TrailingContent
    ) where TrailingContent: View {
        self.title = title
        self.tralingBarButton = { tralingBarButton().asAnyView() }
    }

    public init<LeadingContent>(
        title: String,
        leadingBarButton: @escaping () -> LeadingContent
    ) where LeadingContent: View {
        self.title = title
        self.leadingBarButton = { leadingBarButton().asAnyView() }
    }

    public init<TrailingContent, LeadingContent>(
        title: String,
        leadingBarButton: @escaping () -> LeadingContent,
        tralingBarButton: @escaping () -> TrailingContent
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
            divider
        }
    }

    // MARK: - Views

    private var backgoundStatusBar: some View {
        Rectangle()
            .fill(navigationBarSetting.backgoundColor)
            .frame(height: stylingProvider.statusBarHeight)
    }

    private var navigationBar: some View {
        ZStack(alignment: .leading) {
            buttons
            titleView
        }
        .frame(height: stylingProvider.navigationBarHeight)
        .background(navigationBarSetting.backgoundColor)
    }

    private var titleView: some View {
        HStack {
            Spacer()
            Text("\(title)")
            Spacer()
        }
    }

    private var buttons: some View {
        HStack(spacing: 4) {
            backButton
            leadingBarButton?()
                .frame(width: stylingProvider.navigationButtonSize, height: stylingProvider.navigationButtonSize)
                .padding(3)
            Spacer()
            tralingBarButton?()
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
                    .font(.body.bold())
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
