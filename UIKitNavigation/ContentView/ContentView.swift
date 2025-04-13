//
//  ContentView.swift
//  UIKitNavigation
//
//  Created by Marek Pridal on 13.04.2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
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
