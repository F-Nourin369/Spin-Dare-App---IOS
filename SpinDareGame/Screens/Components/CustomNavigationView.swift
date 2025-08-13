//
//  CustomNavigationView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 13/08/25.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        ZStack {
            
                Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.red, Color.black],
                        startPoint: .leading,
                        endPoint: .trailing ))
            .frame(maxWidth: .infinity, maxHeight: 65)
            .background(
                LinearGradient(
                    colors: [Color.red, Color.black],
                    startPoint: .leading,
                    endPoint: .trailing ))
            
        }
    }
}

#Preview {
    CustomNavigationView()
}
