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

        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class InputViewController: UITableViewController {
    var date: Date = Date() {
        didSet {
            self.title = "\(self.date.year)/\(self.date.month)/\(self.date.day)"
        }
    }
    lazy var closeButton: UIBarButtonItem = {
        let result: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("close", comment: "close"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.closeButtonDidTapped(_:)))
        return result
    }()
    lazy var saveButton: UIBarButtonItem = {
        let result: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("save", comment: "save"), style: UIBarButtonItemStyle.done, target: self, action: #selector(self.saveButtonDidTapped(_:)))
        return result
    }()
    lazy var titleField: UITextField = {
        let result: UITextField = UITextField()
        result.frame = CGRect(x: 0.0, y: 0.0, width: 180.0, height: 32.0)
        result.borderStyle = UITextBorderStyle.roundedRect
        return result
    }()

    lazy var descriptionField: UITextField = {
        let result: UITextField = UITextField()
        result.frame = CGRect(x: 0.0, y: 0.0, width: 180.0, height: 32.0)
        result.borderStyle = UITextBorderStyle.roundedRect
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
        self.view.backgroundColor = UIColor.white()

        self.tableView.register(InputViewCell.self, forCellReuseIdentifier: InputViewCell.cellIdentifier)
    }

    func closeButtonDidTapped(_ button: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    func saveButtonDidTapped(_ button: UIBarButtonItem) {
        self.view.endEditing(true)

        let valids: [Bool] = [self.titleValidator.run(self.titleField.text ?? ""), self.descriptionValidator.run(self.descriptionField.text ?? "")]
        let valid: Bool = valids.filter { (val: Bool) in
            return val
        }.count == valids.count

        guard valid else {
            let errors: [String] = (self.titleValidator.errors + self.descriptionValidator.errors).flatMap { (error: NSError) in
                return error.localizedDescription
            }
            let alertViewController: UIAlertController = UIAlertController(title: NSLocalizedString("error", comment: "error"), message: errors.joined(separator: "\n"), preferredStyle: UIAlertControllerStyle.alert)
            alertViewController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.default, handler: nil))
            self.present(alertViewController, animated: true, completion: nil)
            return
        }

        let alertViewController: UIAlertController = UIAlertController(title: NSLocalizedString("valid", comment: "valid"), message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }
}

extension InputViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InputColumns.count.rawValue
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: InputViewCell = tableView.dequeueReusableCell(withIdentifier: InputViewCell.cellIdentifier, for: indexPath) as? InputViewCell, column: InputColumns = InputColumns(rawValue: (indexPath as NSIndexPath).row) else {
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
