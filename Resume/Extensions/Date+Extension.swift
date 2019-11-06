//
//  Date+Extension.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

extension Date {
    func toString(with formatter: DateFormatter = .MMMMYYYY) -> String {
        return formatter.string(from: self)
    }
    
    func getFormattedTimeRange(to endDate: Date?) -> String {
        return "\(self.toString()) - \((endDate?.toString() ?? "Now"))"
    }
    
    func getFormattedTimePeriod(to endDate: Date?) -> String {
        
        let diffDateComponents = NSCalendar.current.dateComponents([.year, .month], from: self, to: endDate ?? Date())
        let (years, months) = (diffDateComponents.year ?? 0, diffDateComponents.month ?? 0)
        
        return "\(years) Years \(months) Months"
    }
    
    func getFormattedTimePeriodAndRange(to endDate: Date?) -> String {
        
        
        return "\(getFormattedTimeRange(to: endDate)) · \(getFormattedTimePeriod(to: endDate))"
    }
    
}
