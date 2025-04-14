import SwiftUI

struct FeatureAView: View {
    @ObservedObject var viewModel: FeatureAViewModel
    @State private var showSheet = false

    var body: some View {
        VStack(spacing: 10) {
            Text("ProductID: \(viewModel.productID)")
            Button("Show Sheet in Coordinator") {
                viewModel.onAction(.showSheet)
            }
            Button("Show Sheet in SwiftUI") {
                showSheet = true
            }
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
        .sheet(isPresented: $showSheet) {
            Text("Sheet in SwiftUI")
                .presentationDetents([.medium])
        }
    }
}

final class FeatureAViewModel: ObservableObject {
    enum Action {
        case showSheet
        case featureB
    }

    let onAction: @MainActor (Action) -> Void
    let productID: String

    init(productID: String, onAction: @escaping @MainActor (Action) -> Void) {
        self.productID = productID
        self.onAction = onAction
    }
}
