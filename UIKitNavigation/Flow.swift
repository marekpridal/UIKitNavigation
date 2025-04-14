import Navigation
import SwiftUI

struct Flow: View {
    let appCoordinator: any Coordinator

    @ViewBuilder let contentViewBuilder: (
        @escaping @MainActor (ContentViewModel.Action) -> Void
    ) -> ContentView

    @State private var pushPresentation: Bool = false
    @State private var modalPresentation: Bool = false

    var body: some View {
        contentViewBuilder { action in
            switch action {
            case .pushPresentation:
                pushPresentation = true
            case .modalPresentation:
                modalPresentation = true
            }
        }
        .navigationDestination(isPresented: $pushPresentation) {
            NavigationControllerView<FeatureCoordinator>(appCoordinator: appCoordinator, input: .init(productID: "Flow Product ID")) { coordinator in
                pushPresentation = false
                appCoordinator.removeChildCoordinator(childCoordinator: coordinator)
            }
        }
        .fullScreenCover(isPresented: $modalPresentation) {
            NavigationControllerView<FeatureCoordinator>(appCoordinator: appCoordinator, showCloseButton: true) { coordinator in
                modalPresentation = false
                appCoordinator.removeChildCoordinator(childCoordinator: coordinator)
            }
        }
    }
}
