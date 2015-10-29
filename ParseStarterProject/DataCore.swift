//
//  DataCore.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-07-30.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class DataCore: NSObject {
    static var sessions = [PFObject]()
    static var tasks = [PFObject]()
    static var category = [PFObject]()
    
    
    
    static var selectedTask :  String = "Choose a Task"
    static var selectedCategory : String = "Choose a Category"
    static var currentUserID = ""
    
    static var currentUser : PFUser?
    static var date = NSDate()
    static var dateForCreation = ""
    static var endDate : NSDate?
    
    static var currentTableView : UITableView?
    static var currentEndSessionCell : UITableViewCell?
    static var currentShiftTimeCell : UITableViewCell?
    
    
    
    static var weekReport = [PFObject]()
    
}
