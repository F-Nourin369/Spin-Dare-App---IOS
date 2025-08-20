//
//  SpinDareGameApp.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 08/08/25.
//

import SwiftUI

@main
struct SpinDareGameApp: App {
    @StateObject private var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: .splash)
                    .navigationDestination(for: Page.self) {page in
                        coordinator.build(page: page)
                    }
            }
            .environmentObject(coordinator)
        }
    }
}
