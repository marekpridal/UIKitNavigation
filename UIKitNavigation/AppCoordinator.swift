import Navigation
import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    let input: Void?

    init(navigationController: UINavigationController = UINavigationController(), input: Void? = nil) {
        self.navigationController = navigationController
        self.input = input
    }
}
