//
//  CalendarViewCell.swift
//  CalendarSample
//
//  Created by Kazuya Ueoka on 2016/06/21.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import UIKit

class WeekdayCell: UICollectionViewCell {
    static let cellIdentifier: String = "weekdayCellIdentifier"
    lazy var weekdayLabel: UILabel = {
        let result: UILabel = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.textAlignment = NSTextAlignment.Center
        result.font = UIFont.boldSystemFontOfSize(12.0)
        result.textColor = UIColor(white: 0.2, alpha: 1.0)
        return result
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.weekdayLabel)
        self.addConstraints([
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CalendarViewCell: UICollectionViewCell {
    static let cellIdentifier: String = "calendarViewCellIdentifier"
    lazy var dateLabel: UILabel = {
        let result: UILabel = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.textAlignment = NSTextAlignment.Center
        result.font = UIFont.systemFontOfSize(12.0)
        result.textColor = UIColor(white: 0.2, alpha: 1.0)
        return result
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.dateLabel)
        self.addConstraints([
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
