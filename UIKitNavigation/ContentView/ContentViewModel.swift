import Combine

final class ContentViewModel: ObservableObject {
    enum Action: Equatable {
        case pushPresentation
        case modalPresentation
    }

    let output: String?
    let onAction: @MainActor (Action) -> Void

    init(output: String?, onAction: @escaping @MainActor (Action) -> Void) {
        self.output = output
        self.onAction = onAction
    }
}
