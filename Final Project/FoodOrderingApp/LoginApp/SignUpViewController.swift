//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Jing Zou on 11/15/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignUpViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtRePassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func CreateUser(_ sender: UIButton) {
        let email = txtEmail.text
        let password = txtPassword.text
        let rePassword = txtRePassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        if password != rePassword {
            lblStatus.text = "Please ensure passwords are equal"
            return
        }
        
        SwiftSpinner.show("Creating now...")
        
        
        
        Auth.auth().createUser(withEmail: email!, password: password!) { [weak self] authResult, error
            in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self?.txtEmail.text = email
            self?.lblStatus.text = "The user has been created now"
        }
        
    }
}
