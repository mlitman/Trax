//
//  HomeViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-07-13.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className: "Task")
        query.whereKey("userID", equalTo:DataCore.currentUser!)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                
                
                // Do something with the found objects
                if objects != nil {
                    for object in objects! {
                        DataCore.tasks.append(object)
                    }
                    
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
            
        }
        
        query = PFQuery(className: "Session")
        query.whereKey("user", equalTo:DataCore.currentUser!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                
                
                // Do something with the found objects
                if objects != nil {
                    for object in objects! {
                        DataCore.sessions.append(object)
                    }
                    
                }
                
            } else {
                // Log details of the failure
                
            }
        }

        NSLog("Getting Categories")
        query = PFQuery(className: "Category")
        query.whereKey("user", equalTo:DataCore.currentUser!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                
                
                // Do something with the found objects
                if objects != nil {
                    for object in objects! {
                        NSLog("Entry: " + (object.objectForKey("catName") as! String))
                        DataCore.category.append(object)
                        
                    }
                    
                }
                
                
            } else {
                // Log details of the failure
                
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func aboutButton(sender: AnyObject) {
    }

    @IBAction func startSession(sender: AnyObject) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
    }
    

}
