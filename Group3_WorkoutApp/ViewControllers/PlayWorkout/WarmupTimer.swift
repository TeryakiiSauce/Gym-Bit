//
//  WarmupTimer.swift
//  Group3_WorkoutApp
//
//  Created by Ali Alqallaf on 29/12/2021.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 10
let lineWidth: CGFloat = 30
let radius: CGFloat = 150

// uicolor converter
extension Color {
    static let activeTimerColor = Color(AppColors.buttonColor)
    static let rectangleColor = Color(AppColors.bodyBg)
    static let backgroundColor = Color(AppColors.phoneBg)
}
struct WarmupTimer: View {
    
    // check if the timer is running
    @State private var isActive = false
    // time remaining state
    @State private var timeRemaining: CGFloat = defaultTimeRemaining
    // timer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        // vertical stack (columm)
        VStack{
            // stack (elements on top of each other)
            ZStack{
                
                    
                // background circle (not animated)
                Circle()
                    .stroke(Color.gray.opacity(0.2),style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                // active timer circle (animated)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.activeTimerColor,style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                Text("\(Int(timeRemaining))").font(.largeTitle)
            }.frame(width: radius * 2, height: radius * 2)
            
            
            // horizontal stack (row)
            HStack{
                
            }
        }.background(Color.backgroundColor)
        
    }
}

struct WarmupTimer_Previews: PreviewProvider {
    static var previews: some View {
        WarmupTimer()
    }
    
}


