//
//  ListShiftsViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 7/2/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit


class ReportsViewController: UITableViewController {

   var reports = [String]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        reports.append("This Week")
        reports.append("This Month")
                
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return reports.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 

        // Configure the cell...

        cell.textLabel?.text = reports[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if(reports[indexPath.row] == "This Week")
        {
            NSLog("********")
            let today = NSDate()
            let weekAgo = today.dateByAddingTimeInterval(-7 * 24 * 60 * 60)
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            
           
            
       
            let query = PFQuery(className: "Session")
            query.whereKey("startTime", greaterThanOrEqualTo: weekAgo)
           query.whereKey("endTime", lessThanOrEqualTo: today)
          query.whereKey("user", equalTo:DataCore.currentUser!)
            
            DataCore.weekReport.removeAll(keepCapacity: false)
            
            query.findObjectsInBackgroundWithBlock
                {
                (objects: [PFObject]?, error: NSError?) -> Void in
    
                if error == nil {
                
                    if objects != nil {
                        for object in objects! {
                            DataCore.weekReport.append(object)
                            
                        }
                        let weeklyVC = self.storyboard?.instantiateViewControllerWithIdentifier("weekReportViewController") as! WeekReportViewController
                        
                        self.navigationController?.pushViewController(weeklyVC, animated: true)
                    }
                    
                } else {
            
                    
                }
            }
                        
                    }
                 
                    
            }
            
            
        }//1
    

    
    // Override to support conditional editing of the table view.
 

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

