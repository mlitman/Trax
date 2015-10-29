//
//  NewSessionViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-07-13.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class NewSessionViewController: UITableViewController {

    
    @IBOutlet weak var CategoryVIewCell: UITableViewCell!
 
    @IBOutlet weak var startCellDetail: UILabel!
    
    @IBOutlet weak var taskCell: UITableViewCell!
    @IBOutlet weak var AddTaskCell: UITableViewCell!
    @IBOutlet weak var startCell: UITableViewCell!
    
    @IBOutlet weak var intialCell: UITableViewCell!


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(animated: Bool) {
        
        
        let selectedDate: NSDate = DataCore.date
        
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let DateInFormat : String = dateFormatter.stringFromDate(selectedDate)
        
        DataCore.dateForCreation = DateInFormat
        
        startCellDetail.text = DateInFormat
        
        startCell.detailTextLabel?.text = DateInFormat
        
        intialCell.detailTextLabel?.text = DataCore.selectedTask
        
        CategoryVIewCell.detailTextLabel?.text = DataCore.selectedCategory
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
        return 3
    }

    
    
   // override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     //   let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

       // return cell
//    }


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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if(segue.identifier == "sessionOverView")
        {
        let newDestinationController = segue.destinationViewController as! SessionOverViewTableViewController
        
            
           
        
        }
        
    }
    

}
