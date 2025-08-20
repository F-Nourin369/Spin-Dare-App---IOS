//
//  PlayerCountView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 12/08/25.
//

import SwiftUI

struct PlayerCountView: View {
    
    @StateObject var viewModel = PlayerCountViewModel()
    @State var showQuestion: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack      {
                    CustomNavigationView()
                    ScrollView {
                        
                        VStack(spacing : 30) {
                            Text("Number of players")
                                .font(.system(size: 35, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            CounterView(viewModel: viewModel)
                            Button {
                                showQuestion = true
                            } label: {
                                Text("Next")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 30, weight: .bold))
                            }
                            .padding()
                            .padding([.leading, .trailing], 70)
                            .background(
                                LinearGradient(
                                    colors: [Color.red, Color.black],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .cornerRadius(15)
                                .padding(.horizontal, 20))
                        }
                        .padding(.top, 40)
                    }
                    
                    CustomNavigationView()
                }
            }
            .navigationDestination(isPresented: $showQuestion) {
                QuestionAcceptingView(numberOfPlayers: $viewModel.playerCount)
            }
        }
    }
}

#Preview {
    PlayerCountView()
}
