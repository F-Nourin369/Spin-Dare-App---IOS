//
//  CounterView.swift
//  SpinDareGame
//
//  Created by Fathima Nourin on 12/08/25.
//

import SwiftUI

struct CounterView: View {
    
    @State private var pathPoints: [CGPoint] = []
    @State private var isAnimating: Bool = false
    @ObservedObject var viewModel : PlayerCountViewModel
    
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.redTheme.opacity(1), lineWidth: 30)
                .frame(width: 200)
            Circle()
                .trim(from: 0, to: min(1, CGFloat(viewModel.playerCount)/10))
                .stroke(Color.progress.opacity(0.8), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .frame(width: 200)
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut, value: viewModel.playerCount)
                
            Text("\(viewModel.playerCount)")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.black)
        }
        .frame(width: 300, height: 300)
        .contentShape(Circle())
        .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            pathPoints.append(value.location)
                        }
                        .onEnded { _ in
                            if pathPoints.count > 10 {
                                let totalAngle = calculateTotalSignedAngle(points: pathPoints)
                                print(totalAngle)

                                let twoPi = 2 * Double.pi
                                let threshold =  Double.pi/5

                                if totalAngle > threshold && totalAngle < twoPi * 2 {
                                    viewModel.decreamentPlayerCount()
                                } else if totalAngle < -threshold && totalAngle > -twoPi * 2 {
                                    viewModel.increamentPlayerCount()
                                }
                            }

                            pathPoints.removeAll()
                            isAnimating = true

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isAnimating = false
                            }
                        }
                )
    }
    private func calculateTotalSignedAngle(points: [CGPoint]) -> Double {
           var totalAngle: Double = 0
            print("Inside function")
           for i in 1..<points.count - 1 {
               let p0 = points[i - 1]
               let p1 = points[i]
               let p2 = points[i + 1]

               let v1 = CGVector(dx: p1.x - p0.x, dy: p1.y - p0.y)
               let v2 = CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)

               let crossProduct = v1.dx * v2.dy - v1.dy * v2.dx
               let dotProduct = v1.dx * v2.dx + v1.dy * v2.dy
               let mag1 = sqrt(Double(v1.dx * v1.dx + v1.dy * v1.dy))
               let mag2 = sqrt(Double(v2.dx * v2.dx + v2.dy * v2.dy))

               if mag1 * mag2 > 0 {
                   let angle = acos(dotProduct / (mag1 * mag2))
                   totalAngle += crossProduct > 0 ? angle : -angle
               }
           }
           return totalAngle
       }
}

#Preview {
    CounterView(viewModel: PlayerCountViewModel())
}
