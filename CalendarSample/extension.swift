//
//  extension.swift
//  CalendarSample
//
//  Created by Kazuya Ueoka on 2016/06/21.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import Foundation
import FKCalendarView

extension FKCalendarViewWeekday {
    func toString() -> String {
        switch self {
        case .sunday:
            return NSLocalizedString("sun", comment: "sun")
        case .monday:
            return NSLocalizedString("mon", comment: "mon")
        case .tuesday:
            return NSLocalizedString("tue", comment: "tue")
        case .wednesday:
            return NSLocalizedString("wed", comment: "wed")
        case .thursday:
            return NSLocalizedString("thu", comment: "thu")
        case .friday:
            return NSLocalizedString("fri", comment: "fri")
        case .saturday:
            return NSLocalizedString("sat", comment: "sat")
        }
    }
}
