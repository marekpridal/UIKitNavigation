import Navigation
import SwiftUI

struct Flow: View {
    let appCoordinator: any Coordinator

    @ViewBuilder let contentViewBuilder: (
        _ output: String?,
        @escaping @MainActor (ContentViewModel.Action) -> Void
    ) -> ContentView

    @State private var pushPresentation: Bool = false
    @State private var modalPresentation: Bool = false
    @State private var output: String?

    var body: some View {
        contentViewBuilder(output) { action in
            switch action {
            case .pushPresentation:
                pushPresentation = true
            case .modalPresentation:
                modalPresentation = true
            }
        }
        .navigationDestination(isPresented: $pushPresentation) {
            NavigationControllerView<FeatureCoordinator>(appCoordinator: appCoordinator, input: .init(productID: "Flow Product ID")) { (coordinator, output) in
                pushPresentation = false
                print("Output: \(String(describing: output))")
                self.output = output?.investmetOrderID
                appCoordinator.removeChildCoordinator(childCoordinator: coordinator)
            }
        }
        .fullScreenCover(isPresented: $modalPresentation) {
            NavigationControllerView<FeatureCoordinator>(appCoordinator: appCoordinator, showCloseButton: true) { (coordinator, output) in
                modalPresentation = false
                print("Output: \(String(describing: output))")
                self.output = output?.investmetOrderID
                appCoordinator.removeChildCoordinator(childCoordinator: coordinator)
            }
        }
    }
}
