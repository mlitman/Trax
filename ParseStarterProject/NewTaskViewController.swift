//
//  NewTaskViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-07-31.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var taskNameField: UITextField!
    
  
    @IBAction func addTask(sender: AnyObject) {
        let addedTask = PFObject(className: "Task")
        addedTask["Name"] = taskNameField.text
        addedTask["userID"] = DataCore.currentUser
        addedTask.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
            DataCore.tasks.append(addedTask)
                print(DataCore.tasks.count)
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                print("Task already taken")
            }
            
            
        
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    

}
