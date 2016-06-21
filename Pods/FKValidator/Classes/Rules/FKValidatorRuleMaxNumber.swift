//
//  FKValidatorRuleMaxNumber.swift
//  FKValidator
//
//  Created by Ueoka Kazuya on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public class FKValidatorRuleMaxNumber :FKValidatorRule
{
    var number :Float = 0.0
    
    public init(number :Float)
    {
        super.init()
        
        self.number = number
    }
    
    public init(number :Float, errorMessage :String)
    {
        super.init(errorMessage: errorMessage)
        
        self.number = number
    }
    
    override func _commonInit() {
        self.errorCode = .MaxNumber
    }
    
    public override func run(value: String) -> Bool {
        if (super.run(value))
        {
            return true
        }
        
        let num :Float = Float(value)!
        return self.number >= num
    }
}