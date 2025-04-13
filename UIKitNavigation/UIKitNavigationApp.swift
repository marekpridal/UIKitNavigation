//
//  UIKitNavigationApp.swift
//  UIKitNavigation
//
//  Created by Marek Pridal on 13.04.2025.
//

import Navigation
import SwiftUI

final class AppCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
}

@main
struct UIKitNavigationApp: App {
    let appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Flow(appCoordinator: appCoordinator) { action in
                    ContentView(viewModel: ContentViewModel(onAction: action))
                }
            }
        }
    }
}
