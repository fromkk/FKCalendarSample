//
//  InputViewController.swift
//  CalendarSample
//
//  Created by Kazuya Ueoka on 2016/06/21.
//  Copyright © 2016年 fromKK. All rights reserved.
//

import UIKit
import FKValidator

enum InputColumns: Int {
    case title = 0
    case description
    case count

    func toString() -> String {
        switch self {
        case .title:
            return NSLocalizedString("input.title", comment: "title")
        case .description:
            return NSLocalizedString("input.description", comment: "description")
        default:
            return ""
        }
    }
}

class InputViewCell: UITableViewCell {
    static let cellIdentifier: String = "inputViewCellIdentifier"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class InputViewController: UITableViewController {
    var date: NSDate = NSDate() {
        didSet {
            self.title = "\(self.date.year)/\(self.date.month)/\(self.date.day)"
        }
    }
    lazy var closeButton: UIBarButtonItem = {
        let result: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("close", comment: "close"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.closeButtonDidTapped(_:)))
        return result
    }()
    lazy var saveButton: UIBarButtonItem = {
        let result: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("save", comment: "save"), style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.saveButtonDidTapped(_:)))
        return result
    }()
    lazy var titleField: UITextField = {
        let result: UITextField = UITextField()
        result.frame = CGRect(x: 0.0, y: 0.0, width: 180.0, height: 32.0)
        result.borderStyle = UITextBorderStyle.RoundedRect
        return result
    }()

    lazy var descriptionField: UITextField = {
        let result: UITextField = UITextField()
        result.frame = CGRect(x: 0.0, y: 0.0, width: 180.0, height: 32.0)
        result.borderStyle = UITextBorderStyle.RoundedRect
        return result
    }()

    lazy var titleValidator: FKValidator = {
        let result: FKValidator = FKValidator()
        result.addRule(FKValidatorRuleRequired(errorMessage: NSLocalizedString("input.title.required", comment: "input.title.required")))
        result.addRule(FKValidatorRuleMaxLength(length: 10, errorMessage: NSLocalizedString("input.title.maxlength", comment: "input.title.maxlength")))
        return result
    }()

    lazy var descriptionValidator: FKValidator = {
        let result: FKValidator = FKValidator()
        result.addRule(FKValidatorRuleRequired(errorMessage: NSLocalizedString("input.description.required", comment: "input.description.required")))
        result.addRule(FKValidatorRuleMaxLength(length: 100, errorMessage: NSLocalizedString("input.description.maxlength", comment: "input.description.maxlength")))
        return result
    }()

    override func loadView() {
        super.loadView()

        self.title = "\(self.date.year)/\(self.date.month)/\(self.date.day)"
        self.navigationItem.leftBarButtonItem = self.closeButton
        self.navigationItem.rightBarButtonItem = self.saveButton
        self.view.backgroundColor = UIColor.whiteColor()

        self.tableView.registerClass(InputViewCell.self, forCellReuseIdentifier: InputViewCell.cellIdentifier)
    }

    func closeButtonDidTapped(button: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func saveButtonDidTapped(button: UIBarButtonItem) {
        self.view.endEditing(true)

        let valids: [Bool] = [self.titleValidator.run(self.titleField.text ?? ""), self.descriptionValidator.run(self.descriptionField.text ?? "")]
        let valid: Bool = valids.filter { (val: Bool) in
            return val
        }.count == valids.count

        guard valid else {
            let errors: [String] = (self.titleValidator.errors + self.descriptionValidator.errors).flatMap { (error: NSError) in
                return error.localizedDescription
            }
            let alertViewController: UIAlertController = UIAlertController(title: NSLocalizedString("error", comment: "error"), message: errors.joinWithSeparator("\n"), preferredStyle: UIAlertControllerStyle.Alert)
            alertViewController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertViewController, animated: true, completion: nil)
            return
        }

        let alertViewController: UIAlertController = UIAlertController(title: NSLocalizedString("valid", comment: "valid"), message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
}

extension InputViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InputColumns.count.rawValue
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell: InputViewCell = tableView.dequeueReusableCellWithIdentifier(InputViewCell.cellIdentifier, forIndexPath: indexPath) as? InputViewCell, column: InputColumns = InputColumns(rawValue: indexPath.row) else {
            fatalError("cell generate failed")
        }
        switch column {
        case InputColumns.title:
            cell.textLabel?.text = column.toString()
            cell.accessoryView = self.titleField
            break
        case InputColumns.description:
            cell.textLabel?.text = column.toString()
            cell.accessoryView = self.descriptionField
            break
        default:
            cell.textLabel?.text = ""
            cell.accessoryView = nil
            break
        }

        return cell
    }
}
