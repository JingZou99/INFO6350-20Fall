//
//  ForgotPasswordViewController.swift
//  LoginApp
//
//  Created by Jing Zou on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let email = txtEmail.text
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Sending...")
        
        Auth.auth().sendPasswordReset(withEmail: email!) {[weak self] error
            in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            strongSelf.lblStatus.text = "An Email Reset Link Has Been Sent"
        }
    }
}
