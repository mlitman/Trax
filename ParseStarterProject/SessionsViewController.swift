//
//  SessionsViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-07-13.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class SessionsViewController: UITableViewController {

    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return DataCore.sessions.count
    }

    
    
    
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 

        
     //  Configure the cell...
    
    let dateFormatter = NSDateFormatter()
    
    dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
    dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
    
    if(indexPath.row == 0){
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
    return cell
    }
      let date = DataCore.sessions[indexPath.row].objectForKey("startTime") as! NSDate
    

    cell.textLabel?.text = dateFormatter.stringFromDate(date)
    
    cell.detailTextLabel?.text = DataCore.sessions[indexPath.row].objectForKey("taskName") as? String
    
    
    return cell
}
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
