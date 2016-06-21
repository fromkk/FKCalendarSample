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
        case .Sunday:
            return NSLocalizedString("sun", comment: "sun")
        case .Monday:
            return NSLocalizedString("mon", comment: "mon")
        case .Tuesday:
            return NSLocalizedString("tue", comment: "tue")
        case .Wednesday:
            return NSLocalizedString("wed", comment: "wed")
        case .Thursday:
            return NSLocalizedString("thu", comment: "thu")
        case .Friday:
            return NSLocalizedString("fri", comment: "fri")
        case .Saturday:
            return NSLocalizedString("sat", comment: "sat")
        }
    }
}
