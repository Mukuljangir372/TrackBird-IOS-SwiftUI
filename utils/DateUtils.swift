//
//  DateUtils.swift
//  TrackBird
//
//  Created by Mukul Jangir on 12/06/22.
//

import Foundation

enum DateFormat : String {
    case DATE_MONTH_YEAR = "d MMM yyyy"
    case HOUR_MINUTE = "HH:mm"
}

class DateUtils {
    static let shared = DateUtils()
    private init() {}

    private let formatter = DateFormatter()
    
    var timestamp: Double {
        return NSDate().timeIntervalSince1970
    }
    
    func toDate(stamp: Double) -> NSDate {
        let interval = TimeInterval(stamp)
        return NSDate(timeIntervalSince1970: TimeInterval(interval))
    }
    func format(date: NSDate, format: String) -> String {
        self.formatter.dateFormat = format
        return self.formatter.string(from: date as Date)
    }
    func format(stamp: Double, format: String) -> String {
        let date = toDate(stamp: stamp)
        self.formatter.dateFormat = format
        return self.formatter.string(from: date as Date)
    }
}
