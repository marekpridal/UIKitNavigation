import Navigation
import SwiftUI

@main
struct UIKitNavigationApp: App {
    let appCoordinator = AppCoordinator(navigationController: UINavigationController())

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Flow(appCoordinator: appCoordinator) { output, action in
                    ContentView(viewModel: ContentViewModel(output: output, onAction: action))
                }
            }
        }
    }
}
