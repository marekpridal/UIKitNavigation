import SwiftUI

struct FeatureAView: View {
    @ObservedObject var viewModel: FeatureAViewModel

    var body: some View {
        Button("Feature B") {
            viewModel.onAction(.featureB)
        }
    }
}

final class FeatureAViewModel: ObservableObject {
    enum Action {
        case featureB
    }

    let onAction: @MainActor (Action) -> Void

    init(onAction: @escaping @MainActor (Action) -> Void) {
        self.onAction = onAction
    }
}
