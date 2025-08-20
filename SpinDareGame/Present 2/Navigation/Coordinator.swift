//
//  Coordinator.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 20/08/25.
//

import Foundation
import SwiftUI

class Coordinator : ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    func pop() {
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    func dismissSheet() {
        self.sheet = nil
    }
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
            case .splash:
                SplashView()
        case .playerCount:
            PlayerCountView()
        case .questionAccept(numberOfPlayers: let players):
            QuestionAcceptingView(numberOfPlayers: .constant(players))
        }
    }
}




