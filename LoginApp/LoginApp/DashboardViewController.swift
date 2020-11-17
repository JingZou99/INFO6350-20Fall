//
//  DashboardViewController.swift
//  LoginApp
//
//  Created by Jing Zou on 11/15/20.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var lblStatus: UILabel!

    var dictionary: [String: AnyObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblStatus.text = "Login Successfully"
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popViewController(animated: true)
        }
        catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
            lblStatus.text = signOutError.localizedDescription
        }

        
    }
    

}
