//
//  ViewController.swift
//  moza-ready
//
//  Created by Syed Rab on 6/28/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("MOZA: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("MOZA: User cancelled Facebook authentication")
            } else {
                print("MOZA: Authenticate with Facebook!")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)

            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("MOZA: Unable to authenticate with Firebase - \(String(describing: error))")
           } else {
                print("MOZA: Authenticate with Firebase!")
            }
        }
    }

    @IBOutlet weak var emailTextField: FancyField!
    @IBOutlet weak var passwordTextField: FancyField!
    @IBAction func siginTapped(_ sender: Any) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("MOZA: Authenticate with Firebase using Email and Password!")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("MOZA: Unable to authenticate with Firebase using Email - \(String(describing: error))")
                        } else {
                            print("MOZA: Authenticate with Firebase using NEW Email and Password!")
                        }
                    })
                    
                }
            })
        }
        
    }
}

