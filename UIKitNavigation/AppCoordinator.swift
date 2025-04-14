import Navigation
import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] = []
    let navigationController: UINavigationController
    let showCloseButton: Bool
    let input: Void?
    let output: Void? = nil
    let coordinatorDidFinish: ((any Coordinator, Void?) -> Void)?

    init(navigationController: UINavigationController = UINavigationController(), input: Void? = nil, showCloseButton: Bool = false, coordinatorDidFinish: ((any Coordinator, Void?) -> Void)? = nil) {
        self.navigationController = navigationController
        self.input = input
        self.showCloseButton = showCloseButton
        self.coordinatorDidFinish = coordinatorDidFinish
    }
}
