//
//  Account.swift
//  GitHub
//
//  Created by Maksim Dehanov on 26.11.16.
//  Copyright © 2016 Maksim Dehanov. All rights reserved.
//

import Foundation

class Account {
    struct StaticShared {
        static var shared = Account()
    }
    
    class func sharedInstance() -> Account {
        return StaticShared.shared
    }
    
    var git: GitHub!
}