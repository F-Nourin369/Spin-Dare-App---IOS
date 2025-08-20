//
//  AppNameView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 11/08/25.
//

import SwiftUI

struct AppNameView: View {
    
    @State var isScaling: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("Darely")
                .foregroundStyle(.red)
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.white)
                .opacity(isScaling ? 1 : 0)
                .shadow(radius: 5, x: 4, y: 5)
                .animation(.easeInOut(duration: 1), value: isScaling)
                
        }
        .onAppear {
            isScaling = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isScaling = true
            }
        }
    }
}

#Preview {
    AppNameView()
}
