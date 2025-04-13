import Navigation
import SwiftUI
import UIKit

final class FeatureCoordinator: CoordinatorWithDidFinish {
    let navigationController: UINavigationController
    var coordinatorDidFinish: ((any CoordinatorWithDidFinish) -> Void)? {
        didSet {
            setupBackButton()
        }
    }
    var childCoordinators: [any Coordinator] = []
    var showCloseButton: Bool {
        didSet {
            setupCloseButton()
        }
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.showCloseButton = false
        start()
    }

    convenience init(navigationController: UINavigationController, coordinatorDidFinish: ((any CoordinatorWithDidFinish) -> Void)?) {
        self.init(navigationController: navigationController)
        self.coordinatorDidFinish = coordinatorDidFinish
    }

    private func start() {
        let controller = UIHostingController(rootView: FeatureAView(viewModel: FeatureAViewModel(onAction: { [weak self] action in
            switch action {
            case .featureB:
                self?.showFeatureB()
            }
        })))
        navigationController.setViewControllers([controller], animated: false)
    }

    private func showFeatureB() {
        let controller = UIHostingController(rootView: FeatureBView(viewModel: FeatureBViewModel(onAction: { [weak self] action in
            switch action {
            case .closeFeatureModule:
                guard let self else { return }
                self.coordinatorDidFinish?(self)
            }
        })))
        navigationController.pushViewController(controller, animated: true)
    }
}
