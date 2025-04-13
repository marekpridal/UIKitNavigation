import Combine

final class ContentViewModel: ObservableObject {
    enum Action: Equatable {
        case pushPresentation
        case modalPresentation
    }

    let onAction: @MainActor (Action) -> Void

    init(onAction: @escaping @MainActor (Action) -> Void) {
        self.onAction = onAction
    }
}
