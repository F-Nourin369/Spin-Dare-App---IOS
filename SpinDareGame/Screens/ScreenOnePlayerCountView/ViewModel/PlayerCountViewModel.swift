//
//  PlayerCountViewModel.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 13/08/25.
//

import Foundation

class PlayerCountViewModel: ObservableObject {
    
    @Published var playerCount: Int = 5
    let playerRange = 0...10
    
    func increamentPlayerCount() {
        playerCount = max(playerCount - 1, 0)
    }
    
    func decreamentPlayerCount() {
        playerCount = min(playerCount + 1, 10)
    }
}
