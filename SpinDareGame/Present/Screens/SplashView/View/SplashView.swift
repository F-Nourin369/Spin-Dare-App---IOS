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
    @State var zoomIn : Bool = false
    @State var showAppName: Bool = false
    
    var body: some View {
        VStack {
            if showSplash {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    VStack (spacing: 0) {
                        Text("Do You")
                            .foregroundStyle(.white)
                            .font(.system(size: 35))
                            .padding(.bottom,0)
                        VStack(alignment: .leading, spacing: 0) {
                            ZStack {
                                Text("Dare?")
                                    .font(.system(size: 100, weight: .bold))
                                    .foregroundColor(.clear)
                                    .overlay(  LinearGradient(colors: [.red, .red], startPoint: .leading, endPoint: .trailing)
                                        .mask( Text("Dare?")
                                            .font(.system(size: 100, weight: .bold))
                                        ))
                                    .scaleEffect(zoomIn ? 1 : 100)
                            }
                            if showAppName {
                                VStack {
                                    Text("#Darely")
                                        .foregroundStyle(.yellow)
                                        .font(.system(size: 30))
                                        .padding(.leading, 30)
                                }
                            }
                        }
                    }
                }
            }
            else{
                PlayerCountView()
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 1)) {
                    zoomIn = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 1)) {
                    showAppName = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               showSplash = false
            }
        }
    }
}

#Preview {
    SplashView()
}
