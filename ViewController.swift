//
//  ViewController.swift
//  IOSWeek14
//
//  Created by admin on 19/06/2020.
//  Copyright © 2020 Fred. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // We give the user a Cat if it works!
        // So we hide it
        image.image = #imageLiteral(resourceName: "cat")
        image.isHidden = true
        
    
        
    }

    @IBAction func logIn(_ sender: Any) {
        
        let email = emailTextField.text!
        let password = passWordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password){authResult,error in
            if let error = error{
                print("Email or Password incorrect!")
            }else {
                print("User logged in!")
                // The we give the user their cat picture
                self.image.isHidden = false
            }
        }
        
        
    }
    
    @IBAction func createNewUser(_ sender: Any) {
        
        let email = emailTextField.text!
        let password = passWordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: password){authResult,error in
            // I know I should not print out the Password! Just for testing
            if let error = error{
                print("Could not create user with: \(email) and \(password)")
            }
            else{
                print("User: \(email) and \(password) has been created!")
            }
        }
        
    }
}

