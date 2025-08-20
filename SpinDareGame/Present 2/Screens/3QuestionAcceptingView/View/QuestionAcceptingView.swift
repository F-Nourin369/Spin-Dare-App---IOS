//
//  QuestionAcceptingView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 18/08/25.
//

import SwiftUI

struct QuestionAcceptingView: View {
    
    @Binding var numberOfPlayers: Int
    @StateObject var viewModel = QuestionAcceptingViewModel()
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.black
                VStack(alignment: .leading) {
                    Spacer()
                    VStack {
                        Text("Enter your Questions")
                            .foregroundStyle(.white)
                            .font(.system(size: 30))
                    }
                    .padding()
                    Spacer()
                    VStack(alignment: .leading) {
                        ForEach(0..<numberOfPlayers) { playerIndex in
                            QuestionView(questionAcceptingViewModel: viewModel, index : playerIndex)
                            Spacer()
                        }                           
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    QuestionAcceptingView(numberOfPlayers: .constant(1))
}
