//
//  FKValidatorConfig.swift
//  FKValidator
//
//  Created by Ueoka Kazuya on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public enum FKValidatorErrorCode :Int
{
    case empty
    case required
    case exactLength
    case minLength
    case maxLength
    case minNumber
    case maxNumber
    case betweenNumber
    case numeric
    case alphabet
    case alnum
    case postalCode
    case telephone
    case email
    case url
    case matchValue
    case matchPattern
}
