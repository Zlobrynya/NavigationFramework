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
                    width: stylingProvider.navigationButtonSize,
                    height: stylingProvider.navigationButtonSize
                )
                .padding(3)
            Spacer()
            trailingBarButton()
                .frame(
                    width: stylingProvider.navigationButtonSize,
                    height: stylingProvider.navigationButtonSize
                )
                .padding(3)
        }.padding(.horizontal, 8)
    }
}
