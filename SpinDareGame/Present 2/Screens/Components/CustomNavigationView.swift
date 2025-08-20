//
//  CustomNavigationView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 13/08/25.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State var headerTitle: String = ""
    @State var leadingText: String? = ""
    @State var trailingText: String? = ""
    @State var leadingImage: String? = "icn-left"
    @State var trailingImage: String? = "gear"
    @State var leadingTextColor: Color = .black
    @State var trailingTextColor: Color = .blue
    
    var leadingButtonAction: (() -> Void)
    var trailingButtonAction: (() -> Void)
    
    var body: some View {
        VStack {
            ZStack {
                /// Header title
                Text(headerTitle)
                   
                
                HStack {
                    /// Leading button
                    if (leadingImage != nil) || (leadingText != nil) {
                        Button {
                            leadingButtonAction()
                        } label: {
                            if let leadingImage {
                                Image(leadingImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(.black)
                                    .frame(width: 20, height: 20)
                            }
                            if let leadingText {
                                Text(leadingText)
                                    .foregroundStyle(leadingTextColor)
                            }
                        }
                    }
                    Spacer()
                    
                    /// trailing button
                    if (trailingImage != nil) || (trailingText != nil) {
                        Button {
                            trailingButtonAction()
                        } label: {
                            if let trailingImage {
                                Image(trailingImage)
                                    .foregroundStyle(.black)
                            }
                            if let trailingText {
                                Text(trailingText)

                                    .foregroundStyle(trailingTextColor)
                            }
                        }
                    }
                }
            }
            .padding([.leading, .trailing])
            .padding(.vertical)
            Rectangle()
                .fill(.gray.opacity(0.2))
                .frame(height: 1)
                .shadow(color:Color.gray.opacity(0.2),radius: 5,x: 0, y: -2)
        }
//        ZStack {
//                Rectangle()
//                .fill(
//                    LinearGradient(
//                        colors: [Color.red, Color.black],
//                        startPoint: .leading,
//                        endPoint: .trailing ))
//            .frame(maxWidth: .infinity, maxHeight: 65)
//            .background(
//                LinearGradient(
//                    colors: [Color.red, Color.black],
//                    startPoint: .leading,
//                    endPoint: .trailing ))
//        }
    }
}

#Preview {
    CustomNavigationView(leadingButtonAction: {}, trailingButtonAction: {})
}
