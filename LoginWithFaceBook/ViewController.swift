//
//  ViewController.swift
//  LoginWithFaceBook
//
//  Created by SOTSYS113 on 10/04/17.
//  Copyright © 2017 SOTSYS113. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    /*************Self Created Var*************/
    let loginManager = FBSDKLoginManager()
    var fbData = [String: AnyObject]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWithFb(_ sender: Any) {
        loginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
            
            if error != nil
            {
                print("error occured with login \(error?.localizedDescription)")
            }
                
            else if (result?.isCancelled)!
            {
                print("login canceled")
            }
                
            else
            {
                if FBSDKAccessToken.current() != nil
                {
                    
                    FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, userResult, error) in
                        
                        
                        if error != nil
                        {
                            print("error occured \(error?.localizedDescription)")
                        }
                        else if userResult != nil
                        {
                            print("Login with FB is success")
                            print(userResult! as Any)
                            let email = userResult as? [String:[AnyObject]]
                            print(email as Any)
                            //
                            //                    let img_URL: String = (userResult.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!
                            //
                            //                            let email = (userResult.objectForKey("email") as? String)!
                            //                            //                            let password = "1234567890" //(userResult.objectForKey("id") as? String)!
                            //                            let password =  (userResult.objectForKey("id") as? String)!
                            //
                            //                            let name = (userResult.objectForKey("name") as? String)!
                            
                        }
                        
                    })
                }
                
            }
            
        }
        
    }

}

