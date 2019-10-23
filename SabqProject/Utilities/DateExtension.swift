//
//  DateExtension.swift
//  SabqProject
//
//  Created by sara.galal on 10/22/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
extension Date {
    /// Returns a DateComponent value with number of days away from a specified date
    var daysSinceNow: DateComponents {
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm ss"
        return Calendar.current.dateComponents([.year , .month, .weekOfMonth, .day, .hour , .minute ,.second], from: self, to: now)
    }
}
