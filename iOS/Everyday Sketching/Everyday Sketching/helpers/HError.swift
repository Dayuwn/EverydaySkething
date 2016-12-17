//
//  HError.swift
//  Everyday Sketching
//
//  Created by Lucas Rollet on 17/12/2016.
//  Copyright © 2016 Lucas Rollet. All rights reserved.
//

import Foundation
import UIKit

// HError
// Helper class used to prevent code repetition in standard alert error showing
class HError {
    
    // Shows an alrt error message
    static func presentErrorAlert(title: String?, message: String?, sender: UIViewController) -> Void {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        sender.present(ac, animated: true)
        
        return
    }
    
    // Returns the user-formatted error message from a NSError
    static func getErrorMessageFromNSError(_ error: NSError) -> String {
        return (error.userInfo["NSLocalizedDescription"] as! String).capitalized
    }
    
}
