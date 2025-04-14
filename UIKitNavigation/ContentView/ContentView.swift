import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack(spacing: 10) {
            Text("Output: \(viewModel.output ?? "nil")")
            Button("Push presentation") {
                viewModel.onAction(.pushPresentation)
            }
            Button("Modal presentation") {
                viewModel.onAction(.modalPresentation)
            }
        }
        .padding()
    }
}
