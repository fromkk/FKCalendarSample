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
    case Empty
    case Required
    case ExactLength
    case MinLength
    case MaxLength
    case MinNumber
    case MaxNumber
    case BetweenNumber
    case Numeric
    case Alphabet
    case Alnum
    case PostalCode
    case Telephone
    case Email
    case URL
    case MatchValue
    case MatchPattern
}