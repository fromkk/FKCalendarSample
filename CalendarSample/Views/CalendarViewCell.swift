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
        result.textAlignment = NSTextAlignment.center
        result.font = UIFont.boldSystemFont(ofSize: 12.0)
        result.textColor = UIColor(white: 0.2, alpha: 1.0)
        return result
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.weekdayLabel)
        self.addConstraints([
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.weekdayLabel, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0)
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
        result.textAlignment = NSTextAlignment.center
        result.font = UIFont.systemFont(ofSize: 12.0)
        result.textColor = UIColor(white: 0.2, alpha: 1.0)
        return result
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.dateLabel)
        self.addConstraints([
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.dateLabel, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
