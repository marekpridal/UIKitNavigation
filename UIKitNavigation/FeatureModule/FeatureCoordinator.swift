import Navigation
import SwiftUI
import UIKit

final class FeatureCoordinator: Coordinator {
    struct Input {
        let productID: String
    }

    struct Output {
        let investmetOrderID: String
    }

    let navigationController: UINavigationController
    let coordinatorDidFinish: ((any Navigation.Coordinator, Output?) -> Void)?
    let showCloseButton: Bool
    let input: Input?

    var childCoordinators: [any Coordinator] = []

    init(navigationController: UINavigationController, input: Input?, showCloseButton: Bool, coordinatorDidFinish: ((any Coordinator, Output?) -> Void)?) {
        self.navigationController = navigationController
        self.input = input
        self.showCloseButton = showCloseButton
        self.coordinatorDidFinish = coordinatorDidFinish
        start()
        guard showCloseButton else { return }
        setupCloseButton()
    }

    private func start() {
        let viewModel = FeatureAViewModel(productID: input?.productID ?? "", onAction: { [weak self] action in
            switch action {
            case .showSheet:
                self?.showSheet()
            case .featureB:
                self?.showFeatureB()
            }
        })
        let controller = UIHostingController(rootView: FeatureAView(viewModel: viewModel))
        controller.title = "UIKit title"
        controller.navigationItem.setRightBarButton(
            UIBarButtonItem(title: "UIKit right bar", style: .done, target: nil, action: nil),
            animated: true
        )
        navigationController.setViewControllers([controller], animated: false)
    }

    private func showSheet() {
        let controller = UIHostingController(rootView: Text("UIKit Sheet"))
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        navigationController.present(controller, animated: true)
    }

    private func showFeatureB() {
        let viewModel = FeatureBViewModel(onAction: { [weak self] action in
            switch action {
            case .closeFeatureModule:
                guard let self else { return }
                self.coordinatorDidFinish?(self, Output(investmetOrderID: "investmentOrderID"))
            }
        })
        let controller = UIHostingController(rootView: FeatureBView(viewModel: viewModel))
        navigationController.pushViewController(controller, animated: true)
    }
}
