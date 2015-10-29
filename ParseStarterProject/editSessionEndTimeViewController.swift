//
//  editSessionEndTimeViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-08-02.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class editSessionEndTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        datepicker.date = DataCore.endDate!
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func confirmEndTime(sender: AnyObject) {
        var timeInterval : NSTimeInterval = 0.0
        
        timeInterval = DataCore.endDate!.timeIntervalSinceDate(datepicker.date)
        
                   let dateFormatter:NSDateFormatter = NSDateFormatter()
            
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            
            let DateInFormat : String = dateFormatter.stringFromDate(datepicker.date)

        DataCore.currentEndSessionCell!.detailTextLabel!.text = DateInFormat
            
            timeInterval = datepicker.date.timeIntervalSinceDate(DataCore.date)
        
        DataCore.currentShiftTimeCell!.detailTextLabel!.text = stringFromTimeInterval(timeInterval) as String
            
        DataCore.endDate = datepicker.date
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }

    func stringFromTimeInterval(interval:NSTimeInterval) -> NSString {
        
        let ti = NSInteger(interval)
        
        var ms = Int((interval % 1) * 1000)
        
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        return NSString(format: "%0.2dh%0.2dm%0.2ds",hours,minutes,seconds)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationViewController = segue.destinationViewController as! SessionOverViewTableViewController
        
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let DateInFormat : String = dateFormatter.stringFromDate(DataCore.endDate!)
        
       destinationViewController.endSessionTime.detailTextLabel?.text = DateInFormat
        
        destinationViewController.timeInterval = DataCore.endDate!.timeIntervalSinceDate(DataCore.date)
        
        destinationViewController.currentTaskCell.detailTextLabel?.text = destinationViewController.stringFromTimeInterval(destinationViewController.timeInterval) as String
    }
    

}
