//
//  ESMainViewController.swift
//  Everyday Sketching
//
//  Created by Lucas Rollet on 18/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import UIKit

class ESMainViewController: UIViewController {
    
    @IBOutlet weak var startButtonBackground: UIView!
    @IBOutlet var currentRatingStars: [UIImageView]!
    @IBOutlet var userRatingStars: [UIButton]!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "MarkerFelt-Wide", size: 22)!]
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = UIColor(red: 215, green: 215, blue: 215, alpha: 1.0)
        
        tabBarController?.tabBar.barTintColor = UIColor.darkGray
        tabBarController?.tabBar.barStyle = UIBarStyle.black
        
        startButtonBackground.layer.cornerRadius = 8
        startButtonBackground.layer.borderColor = UIColor.black.cgColor
        startButtonBackground.layer.borderWidth = 1
    }
    
    // MARK: User Interaction

    @IBAction func actionButtonPressed(_ sender: UIBarButtonItem) {
    
    }
    
    @IBAction func paramButtonPressed(_ sender: UIBarButtonItem) {
    
    }
    
    @IBAction func changeDifficulty(_ sender: UISegmentedControl) {
    
    }
    
    @IBAction func sourceButtonPressed(_ sender: UIButton) {
    
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    
    }
    
    @IBAction func userRatingStarPressed(_ sender: UIButton) {
    
    }
    
}
