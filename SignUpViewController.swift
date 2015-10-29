//
//  SignUpViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 6/30/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, PFLogInViewControllerDelegate{

    @IBOutlet weak var PasswordSignUp: UITextField!
    @IBOutlet weak var EmailSignUp: UITextField!
    
    @IBOutlet weak var UsernameSignUpp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpUser(sender: AnyObject) {
        self.signUp()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    func signUp(){
    
        let newUser = PFUser()
        
        newUser.username = UsernameSignUpp.text
        newUser.password = PasswordSignUp.text
        newUser.email = EmailSignUp.text
        do
        {
          try newUser.signUp()
        }
        catch{}
        
        
    }
    
    
}
