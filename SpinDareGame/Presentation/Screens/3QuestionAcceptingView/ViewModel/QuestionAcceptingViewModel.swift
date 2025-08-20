//
//  QuestionAcceptingViewModel.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 19/08/25.
//

import Foundation
class QuestionAcceptingViewModel : ObservableObject {
    @Published var questions: [String] = Array(repeating: "", count: 10)
    

}
