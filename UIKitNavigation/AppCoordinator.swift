import Navigation
import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
}
