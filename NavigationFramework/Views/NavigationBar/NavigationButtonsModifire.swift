//
//  NavigationButtonsModifire.swift
//  NavigationFramework
//
//  Created by Nikita Nikitin on 31.10.2021.
//

import SwiftUI

struct NavigationButtonsModifier<LeadingContent, TrailingContent>: ViewModifier
    where LeadingContent: View, TrailingContent: View {

    // MARK: - External Dependencies

    @Environment(\.stylingProvider) private var stylingProvider
    @Environment(\.navigationStackCount) private var navigationStackCount

    var leadingBarButton: () -> LeadingContent
    var trailingBarButton: () -> TrailingContent

    // MARK: - Body

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content
            buttons
        }
    }

    // MARK: - Private Functions

    private var buttons: some View {
        HStack(spacing: 4) {
            leadingBarButton()
                .frame(
                    maxWidth: stylingProvider.navigationButtonSize * 3,
                    maxHeight: stylingProvider.navigationButtonSize
                )
                .padding(3)
                .padding(.leading, navigationStackCount.count > 1 ? 8 : 0)
            Spacer()
            trailingBarButton()
                .frame(
                    maxWidth: stylingProvider.navigationButtonSize * 3,
                    maxHeight: stylingProvider.navigationButtonSize
                )
                .padding(3)
        }.padding(.horizontal, 8)
    }
}
