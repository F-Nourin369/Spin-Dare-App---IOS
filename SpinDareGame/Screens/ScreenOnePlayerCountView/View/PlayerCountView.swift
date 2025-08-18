//
//  PlayerCountView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 12/08/25.
//

import SwiftUI

struct PlayerCountView: View {
    
    @StateObject var viewModel = PlayerCountViewModel()
    
    var body: some View {
        ZStack {
            //             Color.black.opacity(0.9)
            VStack      {
                CustomNavigationView()
                ScrollView {
                    
                    VStack(spacing : 30) {
                        Text("Number of players")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundStyle(.black)
                            .padding()
                        CounterView(viewModel: viewModel)
//                        Picker("Select number of players", selection: $viewModel.playerCount) {
//                            ForEach(viewModel.playerRange, id: \.self) { number in
//                                Text("\(number)").tag(number)
//                                    .font(.system(size: 30, weight: .bold))
//                                    .padding()
//                            }
//                        }
//                        .pickerStyle(WheelPickerStyle())
//                        .frame(height: 300)
//                        .clipped()
                        Button {
                            
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
    }
}

#Preview {
    PlayerCountView()
}
