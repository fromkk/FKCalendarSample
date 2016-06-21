//
//  ViewController.swift
//  CalendarSample
//
//  Created by Kazuya Ueoka on 2016/06/21.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import UIKit
import FKCalendarView

class ViewController: UIViewController {

    let date: NSDate = NSDate()

    lazy var calendarView: FKCalendarView = {
        let result: FKCalendarView = FKCalendarView(frame: self.view.bounds, date: NSDate())
        result.calendarDelegate = self
        result.translatesAutoresizingMaskIntoConstraints = false
        result.registerClass(WeekdayCell.self, forCellWithReuseIdentifier: WeekdayCell.cellIdentifier)
        result.registerClass(CalendarViewCell.self, forCellWithReuseIdentifier: CalendarViewCell.cellIdentifier)
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(self.date.year)/\(self.date.month)"

        self.view.addSubview(self.calendarView)
        self.view.addConstraints([
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
            ])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: FKCalendarViewDelegate {
    func dequeueReusableWeekdayCellWithCalendarView(calendarView: FKCalendarView, indexPath: NSIndexPath, weekDay: FKCalendarViewWeekday) -> UICollectionViewCell {
        guard let cell: WeekdayCell = calendarView.dequeueReusableCellWithReuseIdentifier(WeekdayCell.cellIdentifier, forIndexPath: indexPath) as? WeekdayCell else {
            fatalError("weekday cell generate failed")
        }
        cell.weekdayLabel.text = weekDay.toString()
        return cell
    }

    func dequeueReusableDateCellWithCalendarView(calendarView: FKCalendarView, indexPath: NSIndexPath, date: NSDate) -> UICollectionViewCell {
        guard let cell: CalendarViewCell = calendarView.dequeueReusableCellWithReuseIdentifier(CalendarViewCell.cellIdentifier, forIndexPath: indexPath) as? CalendarViewCell else {
            fatalError("cell generate failed")
        }
        cell.dateLabel.text = String(date.day)
        cell.dateLabel.textColor = self.date.month == date.month ? UIColor(white: 0.2, alpha: 1.0) : UIColor(white: 0.7, alpha: 1.0)

        return cell
    }

    func calendarView(calendarView: FKCalendarView, didSelectDayCell cell: UICollectionViewCell, date: NSDate) {
        let viewController: InputViewController = InputViewController()
        viewController.date = date
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}
