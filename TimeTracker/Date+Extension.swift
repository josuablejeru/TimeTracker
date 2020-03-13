//
//  Date+Extension.swift
//  TimeTracker
//
//  Created by Stefan Blos on 11.03.20.
//  Copyright © 2020 Stefan Blos. All rights reserved.
//

import Foundation

extension Date {
    
    func hourString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func dateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self)
    }
    
    func difference(to date: Date) -> String {
        let timeInterval = self.timeIntervalSince(date)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        
        //formatter.dateFormat = "HH:mm"
        guard let hourString = formatter.string(from: timeInterval) else { return "0:00 h"}
        return hourString
    }
    
}