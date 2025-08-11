//
//  SplashView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 11/08/25.
//

import SwiftUI

struct SplashView: View {
    
    @State var isAnimating: Bool = false
    @State var showSplash: Bool = true
    @State var showGame: Bool = false
    
    var body: some View {
        VStack {
        if showSplash {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    VStack (spacing: 12) {
                        if !showGame {
                            Text("Do You")
                                .foregroundStyle(.white)
                                .font(.system(size: 35, weight: .semibold))
                            
                            Text("Dare ?")
                                .foregroundStyle(.redTheme)
                                .font(.system(size: 50 , weight: isAnimating ? .bold : .semibold))
                                .opacity(isAnimating ? 1 : 0)
                                .offset(x: isAnimating ? 0  : 500)
                                .animation(.easeInOut(duration: 0.5), value: isAnimating)
                        }
                        else{
                            AppNameView()
                        }
                    }
                }
            }
            else{
                AppNameView()
                    .transition(.move(edge: .trailing))
            }
        }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showGame = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showSplash = false
                }
                
            }
    }
}

#Preview {
    SplashView()
}
