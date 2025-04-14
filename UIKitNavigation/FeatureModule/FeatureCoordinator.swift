import Navigation
import SwiftUI
import UIKit

final class FeatureCoordinator: CoordinatorWithDidFinish {
    struct Input {
        let productID: String
    }

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
    let input: Input?

    init(navigationController: UINavigationController, input: Input?) {
        self.navigationController = navigationController
        self.input = input
        self.showCloseButton = false
        start()
    }

    private func start() {
        let controller = UIHostingController(rootView: FeatureAView(viewModel: FeatureAViewModel(productID: input?.productID ?? "", onAction: { [weak self] action in
            switch action {
            case .featureB:
                self?.showFeatureB()
            }
        })))
        controller.title = "UIKit title"
        controller.navigationItem.setRightBarButton(
            UIBarButtonItem(title: "UIKit right bar", style: .done, target: nil, action: nil),
            animated: true
        )
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
