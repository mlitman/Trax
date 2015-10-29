//
//  WeekReportViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-08-21.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import MessageUI

class WeekReportViewController: UIViewController, MFMailComposeViewControllerDelegate,UITableViewDataSource, UITableViewDelegate {
    
 var html = "<html><body><table><tr><th>Task</th><th>Start Time</th><th>End Time</th><th>Task Time</th></tr><tr>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let emailButton = UIBarButtonItem(barButtonSystemItem : UIBarButtonSystemItem.Reply, target: self, action: "sendEmail")
        
        let emailButton = UIBarButtonItem(title: "Email", style: UIBarButtonItemStyle.Bordered, target: self , action: "sendEmail")
        
        self.navigationItem.rightBarButtonItem = emailButton
    
        
        for(var i = 0; i < 5; i++)
        {
            html = html + "<tr>"
            html = html + "<td>" + "Reading" + "</td>"
            html = html + "<td>" + "08:07" + "</td>"
            html = html + "<td>" + "09:07" + "</td>"
            html = html + "<td>" + "60" + "</td>"
            html = html + "</tr>"
        }
        html = html + "</tr></table></body></html>"
        print(html, terminator: "")
            }
   
    func sendEmail() {
        
        let mailComposeViewController : MFMailComposeViewController = MFMailComposeViewController()
        
            if MFMailComposeViewController.canSendMail() {
                let mailComposerVC = MFMailComposeViewController()
                mailComposerVC.mailComposeDelegate = self

            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                mailComposerVC.setToRecipients(["neelraina420@yahoo.com"])
                mailComposerVC.setSubject("TraxReport")
                mailComposerVC.setMessageBody("Hello", isHTML: false)

        } else {
            self.showSendMailErrorAlert()
        }
    }
    
   // func configuredMailComposeViewController() -> MFMailComposeViewController {
       // let mailComposerVC = MFMailComposeViewController()
        //mailComposerVC.mailComposeDelegate = self
        
       // mailComposerVC.setToRecipients(["neelraina420@yahoo.com"])
        //mailComposerVC.setSubject("TraxReport")
        //mailComposerVC.setMessageBody("Hello", isHTML: false)
        
       // return mailComposerVC
    //}
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    // MARK: - Table view data source
    
    
    override func viewWillAppear(animated: Bool) {
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return DataCore.weekReport.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd (h:mm a) "

        if(DataCore.weekReport.count > 0){
         let date = DataCore.weekReport[indexPath.row].objectForKey("startTime") as? NSDate
         let date2 = DataCore.weekReport[indexPath.row].objectForKey("endTime") as? NSDate
            
        cell.textLabel?.text = "\(dateFormatter.stringFromDate(date!)) to \(dateFormatter.stringFromDate(date2!)) "
            
        let taskName = DataCore.weekReport[indexPath.row].objectForKey("taskName") as? String
        let taskTime = DataCore.weekReport[indexPath.row].objectForKey("taskTime") as? String
            
        cell.detailTextLabel?.text = "\(taskName!) for \(taskTime!)"
            
        }
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

       // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
