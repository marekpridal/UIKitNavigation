//
//  UIKitNavigationApp.swift
//  UIKitNavigation
//
//  Created by Marek Pridal on 13.04.2025.
//

import SwiftUI

@main
struct UIKitNavigationApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Flow { action in
                    ContentView(viewModel: ContentViewModel(onAction: action))
                }
            }
        }
    }
}
