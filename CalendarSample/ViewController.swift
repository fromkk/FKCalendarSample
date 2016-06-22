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

    let date: Date = Date()

    lazy var calendarView: FKCalendarView = {
        let result: FKCalendarView = FKCalendarView(frame: self.view.bounds, date: Date())
        result.calendarDelegate = self
        result.translatesAutoresizingMaskIntoConstraints = false
        result.register(WeekdayCell.self, forCellWithReuseIdentifier: WeekdayCell.cellIdentifier)
        result.register(CalendarViewCell.self, forCellWithReuseIdentifier: CalendarViewCell.cellIdentifier)
        return result
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(self.date.year)/\(self.date.month)"

        self.view.addSubview(self.calendarView)
        self.view.addConstraints([
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.calendarView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0)
            ])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: FKCalendarViewDelegate {
    func dequeueReusableWeekdayCellWithCalendarView(_ calendarView: FKCalendarView, indexPath: IndexPath, weekDay: FKCalendarViewWeekday) -> UICollectionViewCell {
        guard let cell: WeekdayCell = calendarView.dequeueReusableCell(withReuseIdentifier: WeekdayCell.cellIdentifier, for: indexPath) as? WeekdayCell else {
            fatalError("weekday cell generate failed")
        }
        cell.weekdayLabel.text = weekDay.toString()
        return cell
    }

    func dequeueReusableDateCellWithCalendarView(_ calendarView: FKCalendarView, indexPath: IndexPath, date: Date) -> UICollectionViewCell {
        guard let cell: CalendarViewCell = calendarView.dequeueReusableCell(withReuseIdentifier: CalendarViewCell.cellIdentifier, for: indexPath) as? CalendarViewCell else {
            fatalError("cell generate failed")
        }
        cell.dateLabel.text = String(date.day)
        cell.dateLabel.textColor = self.date.month == date.month ? UIColor(white: 0.2, alpha: 1.0) : UIColor(white: 0.7, alpha: 1.0)

        return cell
    }

    func calendarView(_ calendarView: FKCalendarView, didSelectDayCell cell: UICollectionViewCell, date: Date) {
        let viewController: InputViewController = InputViewController()
        viewController.date = date
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        self.present(navigationController, animated: true, completion: nil)
    }
}
