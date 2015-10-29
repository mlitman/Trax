//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit


class ViewController: UIViewController{

   
   
    
   @IBAction func loginButton(sender: AnyObject) {
      self.checkCredentials()
        
    }
    
    
   @IBOutlet weak var PasswordTextField: UITextField!
    
   @IBOutlet weak var UsernameTextField: UITextField!
    
   override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
          
    

    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
   func checkCredentials(){
      PFUser.logInWithUsernameInBackground(UsernameTextField.text!, password: PasswordTextField.text!){(user:PFUser?, error: NSError?) -> Void in
                if user != nil
                {
                    DataCore.currentUser = user!
                  DataCore.currentUserID = user!.objectId!
                    
                  print("You logged in")
                    let TVC = self.storyboard?.instantiateViewControllerWithIdentifier("Main") as! UITabBarController
                    
                    self.navigationController?.setNavigationBarHidden(true, animated: false)
                    
                    self.navigationController?.pushViewController(TVC, animated: true)
                    
                    
                }else{
                    print("You have failed to log in.")
                }
    }
    
    }
    
}
  
    
    


