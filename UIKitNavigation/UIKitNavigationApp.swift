import Navigation
import SwiftUI



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
