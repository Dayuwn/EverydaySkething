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
        
        var navbar = navigationController?.navigationBar
        //navbar.barTintColor = UIColor.darkGray
        // Override point for customization after application launch.
        navbar?.setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        navbar?.shadowImage = UIImage()
        // Sets the translucent background color
        navbar?.barTintColor = UIColor(red: 65.0, green: 68.0, blue: 72.0, alpha: 1.0)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        navbar?.isTranslucent = true
        
        /// <TEMP>
        let vc = storyboard?.instantiateViewController(withIdentifier: "AppNavController") as! UITabBarController
        
    
        //let navigationController = UINavigationController(rootViewController: vc!)
        present(vc, animated: true, completion: nil)
        /// </TEMP>
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "AppNavController") as! UINavigationController
        //let navigationController = UINavigationController(rootViewController: vc!)
        present(vc, animated: true, completion: nil)
    }
}
