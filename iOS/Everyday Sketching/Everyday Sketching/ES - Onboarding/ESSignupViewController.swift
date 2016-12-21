//
//  ESSignupViewController.swift
//  Everyday Sketching
//
//  Created by Lucas Rollet on 17/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit
import Stormpath

class ESSignupViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfirmationField: UITextField!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: User Interaction
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        let email = emailField.text!
        let username = usernameField.text!
        let password = passwordField.text!
        let passwordConfirmation = passwordConfirmationField.text!
        
        // Checks that password / confirmation match
        if password != passwordConfirmation {
            HError.presentErrorAlert(title: "Passwords don't match !", message: "Please enter the same password in the password and password confirmation fields.", sender: self)
            
            passwordField.text = ""
            passwordConfirmationField.text = ""
            return
        }
        
        // Create user's account
        let account = RegistrationModel(email: email, password: password)
        account.givenName = username
        account.surname = "none" // Temporary until I change the Express config on heroku.
        
        // Register user
        Stormpath.sharedSession.register(account) { (account, error) -> Void in
            guard error == nil else {
                let errMessage = HError.getErrorMessageFromNSError(error!)
                HError.presentErrorAlert(title: "Something went wrong", message: errMessage, sender: self)
                return
            }
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppNavController") as! UITabBarController
            self.present(vc, animated: true, completion: nil)
            
            return
        }
    }
    
}
