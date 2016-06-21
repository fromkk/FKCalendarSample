//
//  FKValidatorRuleMaxLength.swift
//  FKValidator
//
//  Created by Kazuya Ueoka on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public class FKValidatorRuleMaxLength :FKValidatorRule
{
    var length :Int = 0
    
    public init(length :Int) {
        super.init()
        self.length = length
    }
    
    public init(length :Int, errorMessage :String)
    {
        super.init(errorMessage: errorMessage)
        self.length = length
    }
    
    override func _commonInit() {
        self.errorCode = .MaxLength
    }
    
    public override func run(value: String) -> Bool {
        if (super.run(value))
        {
            return true
        }
        
        return self.length >= value.characters.count
    }
}