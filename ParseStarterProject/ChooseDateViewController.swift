//
//  ChooseDateViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-07-15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class ChooseDateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        datepicker.date = DataCore.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func submitDate(sender: AnyObject) {
        DataCore.date = datepicker.date
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }


}
