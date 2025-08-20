//
//  AppEvironment.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 20/08/25.
//

import Foundation
import SwiftUI
 @MainActor
class AppEnvironment : ObservableObject {
    let coordinator: Coordinator
    init() {
        self.coordinator = Coordinator()
    }
}
