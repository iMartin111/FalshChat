//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    // MARK: - IBOutlets:
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    // MARK: - IBActions:
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text,
              let password = passwordTextfield.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Warning", message: e.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                print(e.localizedDescription)
            } else {
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
            
        }
    }
    
}

// user: 1@2.com password: 123456
// user: alfa@beta.com password: 123456
