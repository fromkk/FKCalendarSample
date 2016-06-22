//
//  FKValidator.swift
//  FKValidator
//
//  Created by Kazuya Ueoka on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public class FKValidator :NSObject
{
    public var rules: Array <FKValidatorRule> = []
    public var errors :Array <NSError> = []
    
    public func addRule(_ rule :FKValidatorRule) -> Self
    {
        self.rules.append(rule)
        return self
    }
    
    public func addRules(_ rules :Array<FKValidatorRule>) -> Self
    {
        for rule in rules
        {
            _ = self.addRule(rule)
        }
        
        return self
    }
    
    public func run(_ value :String) -> Bool
    {
        var result :Bool = true
        self.errors = []
        for rule in self.rules
        {
            if (false == rule.run(value) )
            {
                result = false
                self.errors.append(rule.error)
            }
        }
        return result
    }
}
