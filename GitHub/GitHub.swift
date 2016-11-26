//
//  Login.swift
//  Github
//
//  Created by Austin Cherry on 6/3/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//
import UIKit

struct GitHub {
    let clientId = "80b1798b0b410dd723ee"
    let clientSecret = "58b7abd90008cb39626802d4bb9444c53d9d79ad"
    var basicAuth = ""
    
    init(username: String, password: String) {
        let optData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)
        if let data = optData {
            basicAuth = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        }
    }
    
    func auth(completionHandler: (Bool -> Void)) -> Void {
        
        let params = ["scopes":"repo", "note": "dev", "client_id": clientId, "client_secret": clientSecret]
        
        do {
            let opt = try HTTP.GET("https://api.github.com/user/repos"/*"authorizations"*/, parameters: params, headers: ["Authorization": "Basic \(basicAuth)"] ,requestSerializer: JSONParameterSerializer())
            opt.start { response in
                if let error = response.error {
                    print("got an error: \(error)")
                    dispatch_async(dispatch_get_main_queue(),{
                        completionHandler(false)
                    })
                    
                    return
                }
                print(String(data: response.data, encoding: NSUTF8StringEncoding))
                completionHandler(true)
            }
        } catch let error {
            dispatch_async(dispatch_get_main_queue(),{
                completionHandler(false)
            })
            print("got an error creating the request: \(error)")
        }
    }
}