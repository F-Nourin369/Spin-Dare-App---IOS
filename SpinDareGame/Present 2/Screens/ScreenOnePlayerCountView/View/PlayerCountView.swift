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
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            VStack      {
                CustomNavigationView(leadingImage: "", leadingButtonAction: coordinator.pop) {
                }
                ScrollView {
                    VStack(spacing : 30) {
                        Text("Number of players")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundStyle(.black)
                            .padding()
                        CounterView(viewModel: viewModel)
                        Button {
                            coordinator.push(.questionAccept(numberOfPlayers: viewModel.playerCount))
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
            }
        }
    }
}

struct PlayerCountView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCountView()
            .environmentObject(Coordinator())
    }
}
