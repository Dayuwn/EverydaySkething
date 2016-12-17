//
//  ESLoginViewController.swift
//  Everyday Sketching
//
//  Created by Lucas Rollet on 11/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit
import Stormpath

class ESLoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: User Interactions
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        let email = emailField.text!
        let password = passwordField.text!
        
        // Login user
        Stormpath.sharedSession.login(email, password: password) { (success, error) -> Void in
            // Alerts the user if login failed
            guard error == nil else {
                let errMessage = HError.getErrorMessageFromNSError(error!)
                HError.presentErrorAlert(title: "Something went wrong", message: errMessage, sender: self)
                return
            }
            
            // Pushes to main view if user is logged in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ESHostViewController")
            let navigationController = UINavigationController(rootViewController: vc!)
            
            self.present(navigationController, animated: true, completion: nil)
            return
        }
    }

    // Displays an alert with a text field asking for the account's email, then resets with Stormpath.
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        let ac = UIAlertController(title: "Password Reset", message: "Enter your account's mail:", preferredStyle: .alert)
        
        ac.addTextField() { (textField: UITextField!) -> Void in
            textField.placeholder = "Email"
            textField.keyboardType = .emailAddress
            return
        }
        ac.addAction(UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            let email = ac.textFields![0].text!
            Stormpath.sharedSession.resetPassword(email) { (success, error) -> Void in
                guard error == nil else {
                    let errMessage = HError.getErrorMessageFromNSError(error!)
                    HError.presentErrorAlert(title: "Something went wrong", message: errMessage, sender: self)
                    return
                }
                return
            }
            return
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
}
