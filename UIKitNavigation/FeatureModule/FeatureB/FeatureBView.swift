import SwiftUI

struct FeatureBView: View {
    @ObservedObject var viewModel: FeatureBViewModel

    var body: some View {
        Button("Close Feature Module") {
            viewModel.onAction(.closeFeatureModule)
        }
    }
}


final class FeatureBViewModel: ObservableObject {
    enum Action {
        case closeFeatureModule
    }

    let onAction: @MainActor (Action) -> Void

    init(onAction: @escaping @MainActor (Action) -> Void) {
        self.onAction = onAction
    }
}
