//
//  ESHostViewController.swift
//  Everyday Sketching
//
//  Created by Lucas Rollet on 11/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit
import Stormpath

class ESHostViewController: UIViewController {

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: User interaction
    
    @IBAction func onLoginButtonPress(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ESLoginViewController") as! ESLoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onSignupButtonPress(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ESSignupViewController") as! ESSignupViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onSkipButtonPress(_ sender: UIButton) {
    }
}
