//
//  SessionOverViewTableViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-08-01.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class SessionOverViewTableViewController: UITableViewController {

    @IBOutlet weak var startSessionTime: UITableViewCell!
    
    @IBOutlet weak var endSessionTime: UITableViewCell!
    
    var endSessionPressed = false
    
    
    @IBOutlet weak var currentTaskCell: UITableViewCell!
    
    @IBAction func endSessionButton(sender: AnyObject) {
        
        
            let button = sender as! UIButton
        
            button.hidden = true
        
            DataCore.endDate = NSDate()
        
            let dateFormatter:NSDateFormatter = NSDateFormatter()
            
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            
            let DateInFormat : String = dateFormatter.stringFromDate(DataCore.endDate!)
            
            endSessionTime.detailTextLabel?.text = DateInFormat
            
            timeInterval = DataCore.endDate!.timeIntervalSinceDate(DataCore.date)
            
            currentTaskCell.detailTextLabel?.text = self.stringFromTimeInterval(timeInterval) as String
        
        
            createSessionButton.hidden = false
            endSessionPressed = true
    }
    
    
    @IBOutlet weak var createSessionButton: UIButton!
    
    @IBAction func createSession(sender: AnyObject) {
        
        
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        let stime = startSessionTime.detailTextLabel?.text
        
        
        let SDateInFormat = dateFormatter.dateFromString(stime!)
        
        let EDateInFormat = dateFormatter.dateFromString((endSessionTime.detailTextLabel?.text)!)
    

        
        let newSession =  PFObject(className:"Session")
        
        newSession["taskName"] = currentTaskCell.textLabel?.text
        
        newSession["startTime"] = SDateInFormat
        
        newSession["endTime"] = EDateInFormat
        
        newSession["taskTime"] = currentTaskCell.detailTextLabel?.text
        
        newSession["user"] = DataCore.currentUser
        
        newSession["category"] = DataCore.selectedCategory
        
        DataCore.sessions.append(newSession)
        
        newSession.saveInBackgroundWithBlock
            {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    
                    print("\(DataCore.currentUserID)")
                    
                    
                    self.navigationController?.popToRootViewControllerAnimated(true)
                    
                    self.endSessionPressed = false
                } else {
                    
                    print("Process Failed")
                    
                }
        
        }
    }
    
    
    
    var timeInterval : NSTimeInterval = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startSessionTime.textLabel?.text = "Start"
        endSessionTime.textLabel?.text = "End"
        
        startSessionTime.detailTextLabel?.text = DataCore.dateForCreation
        currentTaskCell.textLabel?.text = DataCore.selectedTask
        
        DataCore.currentEndSessionCell = self.endSessionTime
        DataCore.currentShiftTimeCell =  self.currentTaskCell
        
        createSessionButton.hidden = true
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if(section == 0){
        return 2
        }
        else{
        return 1
        }
    }
    
    func stringFromTimeInterval(interval:NSTimeInterval) -> NSString {
        
        let ti = NSInteger(interval)
        
        var ms = Int((interval % 1) * 1000)
        
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        return NSString(format: "%0.2dh%0.2dm%0.2ds",hours,minutes,seconds)
    }

        
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (identifier == "edit" && endSessionPressed == true)
        {
        
        return true
        
        
        }
        else {
        
        return false
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "edit")
        {
        
          DataCore.endDate = NSDate()
           
        }
    }
    

}
