//
//  FKValidatorRulePostalCode.swift
//  FKValidator
//
//  Created by Ueoka Kazuya on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public class FKValidatorRulePostalCode :FKValidatorRuleMatchPattern
{
    let _pattern :String = "^[0-9]{3}\\-[0-9]{4}$"
    
    public init()
    {
        super.init(pattern: self._pattern)
    }
    
    public init(errorMessage: String)
    {
        super.init(pattern: self._pattern, errorMessage: errorMessage)
    }
    
    override func _commonInit()
    {
        self.errorCode = FKValidatorErrorCode.PostalCode
    }
}