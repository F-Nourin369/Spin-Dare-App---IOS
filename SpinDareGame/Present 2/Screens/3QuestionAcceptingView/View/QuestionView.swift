//
//  QuestionView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 18/08/25.
//

import SwiftUI

struct QuestionView: View {
    
    @ObservedObject var questionAcceptingViewModel : QuestionAcceptingViewModel
    @State var index : Int
    @State var isConfirmed: Bool = false
    
    var body: some View {
        VStack(alignment : .leading) {
            Text("Player \(index + 1) ")
                .foregroundStyle(.red)
                .font(.system(size: 20, weight: .bold))
            HStack {
                TextField("Question", text: $questionAcceptingViewModel.questions[index])
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5, x: 0, y: 2)
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(questionAcceptingViewModel.questions[index].isEmpty ? .blue.opacity(0.3) : .blue)
            }
        }
    }
}

#Preview {
    QuestionView(questionAcceptingViewModel: QuestionAcceptingViewModel(), index: 3)
}
