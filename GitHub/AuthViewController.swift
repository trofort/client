//
//  ViewController.swift
//  GitHub
//
//  Created by Maksim Dehanov on 26.11.16.
//  Copyright © 2016 Maksim Dehanov. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var session: NSURLSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
        Account.sharedInstance().git = GitHub(username: loginTextField.text!, password: passwordTextField.text!)
        Account.sharedInstance().git.auth({ (status: Bool) in
            if status {
                print("yes")
            } else {
                let alert = UIAlertView(title: "Failed to Login.", message: "Invalid Username or Password", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
        /*let userPasswordString = "\(loginTextField.text!):\(passwordTextField.text!)"
        
        let requestString = "https://api.github.com/users/whatever?client_id=80b1798b0b410dd723ee&client_secret=58b7abd90008cb39626802d4bb9444c53d9d79ad"
        let url = NSURL(string: requestString)!
        let req = NSURLRequest(URL: url)
        let userPasswordData = userPasswordString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64EncodedCredential = userPasswordData?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        let authString = "Basic \(base64EncodedCredential)"
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["Authorization":authString/*, "Accept":"application/vnd.github.v3+json", "Content-Type":"application/json"*/]
        
        self.session = NSURLSession(configuration: sessionConfig)
        
        let dataTask = self.session.dataTaskWithRequest(req) { (data, response, error) in
            do {
                if let httpResponse = response as? NSHTTPURLResponse {
                    print("error \(httpResponse.statusCode)")
                }
                _ = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0))
                let strData = String(data: data!, encoding: NSUTF8StringEncoding)
                print(strData)
                print()
            } catch {}
        }
        dataTask.resume()*/
    }
}

