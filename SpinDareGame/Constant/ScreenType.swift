//
//  ScreenType.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 20/08/25.
//

import Foundation
import SwiftUI

enum Page : Hashable {
    case splash
    case playerCount
    case questionAccept(numberOfPlayers: Int)
}

enum Sheet: String, Identifiable {
    var id : String { self.rawValue }
    case sheetView
}

enum FullScreenCover : String, Identifiable {
    var id : String { self.rawValue }
    case fullScreenCover
}
