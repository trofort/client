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
    var repositories: Response!
}

class Repositpry {
    var name = ""
    var owner = ""
    var date = ""
    var descripton = ""
    
    init(json: [NSDictionary]) {
        self.name = json["name"] as! String
        self.owner = (json["owner"] as! NSDictionary)["login"] as! String
        self.date = json[""]
    }
}