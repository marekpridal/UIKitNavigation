//
//  Flow.swift
//  UIKitNavigation
//
//  Created by Marek Pridal on 13.04.2025.
//

import SwiftUI

struct Flow: View {
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
            Text("Push")
        }
        .fullScreenCover(isPresented: $modalPresentation) {
            Text("Full screen")
        }
    }
}
