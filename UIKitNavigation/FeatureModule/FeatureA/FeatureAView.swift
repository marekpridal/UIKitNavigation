import SwiftUI

struct FeatureAView: View {
    @ObservedObject var viewModel: FeatureAViewModel

    var body: some View {
        VStack {
            Text("ProductID: \(viewModel.productID)")
            Button("Feature B") {
                viewModel.onAction(.featureB)
            }
        }
        .navigationTitle("SwiftUI title")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Top Bar Trailing", action: {
                    print("button")
                })
            }
        }
    }
}

final class FeatureAViewModel: ObservableObject {
    enum Action {
        case featureB
    }

    let onAction: @MainActor (Action) -> Void
    let productID: String

    init(productID: String, onAction: @escaping @MainActor (Action) -> Void) {
        self.productID = productID
        self.onAction = onAction
    }
}
