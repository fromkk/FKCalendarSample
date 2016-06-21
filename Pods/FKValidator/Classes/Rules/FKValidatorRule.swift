//
//  FKValidatorRule.swift
//  FKValidator
//
//  Created by Kazuya Ueoka on 2015/12/13.
//  Copyright © 2015年 fromKK. All rights reserved.
//

import Foundation

public class FKValidatorRule :NSObject
{
    var errorCode :FKValidatorErrorCode = .Empty
    var errorMessage :String = ""
    var error :NSError
        {
        get
        {
            return NSError(domain: "FKValidatorRule", code: self.errorCode.rawValue, userInfo: [NSLocalizedDescriptionKey: self.errorMessage])
        }
    }
    
    public override init()
    {
        super.init()
        
        self._commonInit()
    }
    
    public init(errorMessage :String)
    {
        super.init()
        
        self._commonInit()
        self.errorMessage = errorMessage
    }
    
    func _commonInit() -> Void
    {
        
    }
    
    public func run(value :String) -> Bool
    {
        return 0 == value.characters.count
    }
}