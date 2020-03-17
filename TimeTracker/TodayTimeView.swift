//
//  TodayTimeView.swift
//  TimeTracker
//
//  Created by Stefan Blos on 12.03.20.
//  Copyright © 2020 Stefan Blos. All rights reserved.
//

import SwiftUI

struct TodayTimeView: View {
    
    @State private var endAngle: Double = 0.0
    @Binding var workday: Workday?
    
    var body: some View {
        ZStack {
            Color.offWhite
            
            VStack {
                Text("Start time:")
                    .font(.footnote)
                
                Text(workday?.start?.hourString() ?? "--:--")
                    .font(.title)
                
                if workday?.end != nil {
                    Group {
                        VStack {
                            Text("End time:")
                                .font(.footnote)
                            
                            Text(workday?.end?.hourString() ?? "00:00")
                                .font(.title)
                        }
                    }
                    .animation(.default)
                }
            
            }
            .padding(60)
            .background(
                Arc(endAngle: endAngle)
                    .stroke(LinearGradient(Color.codecampVeryDarkBlue, Color.codecampLessDarkBlue, Color.codecampABitLightBlue, Color.codecampReallyLightBlue), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .animation(.interpolatingSpring(mass: 1, stiffness: 25, damping: 8, initialVelocity: 1))
            )
            .padding(40)
            .background(
                Circle()
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
        }
        .onAppear {
            self.endAngle = self.calculateDuration()
        }
    }
    
    func calculateDuration() -> Double {
        guard let start = workday?.start else { return 0.0 }
        let workingTimeInMinutes = Double((workday?.end ?? Date()).timeIntervalSince(start) / 60) - (workday?.breakDuration ?? 0)
        let workdayInMinutes = Double(60 * 8) // 8 hours
        let portionOfWorkday = workingTimeInMinutes / workdayInMinutes
        return Double(portionOfWorkday * 360.0)
    }
}

/*
struct TodayTimeView_Previews: PreviewProvider {
    static var previews: some View {
        TodayTimeView(startDate: Date(), endDate: Date(), breakDuration: 0)
    }
}
 */
