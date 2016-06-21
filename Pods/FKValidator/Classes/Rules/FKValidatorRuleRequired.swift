//
//  FKValidatorRuleRequired.swift
//  FKValidator
//
//  Created by Kazuya Ueoka on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public class FKValidatorRuleRequired :FKValidatorRule
{
    public override init()
    {
        super.init()
    }
    
    public override init(errorMessage: String) {
        super.init()
        self.errorMessage = errorMessage
    }
    
    override func _commonInit() {
        super._commonInit()
        
        self.errorCode = .Required
    }
    
    public override func run(value :String) -> Bool
    {
        return !super.run(value)
    }
}