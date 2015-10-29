//
//  CategoryViewController.swift
//  ParseStarterProject
//
//  Created by Neel Raina on 2015-08-08.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var categoryTextField: UITextField!
    
    
    @IBAction func createCategoryButton(sender: AnyObject) {
        
        let newCategory = PFObject(className: "Category")
        
        newCategory["catName"] = categoryTextField.text
        newCategory["user"] = DataCore.currentUser!
        
            
        newCategory.saveInBackgroundWithBlock
            {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    
                    
                    DataCore.category.append(newCategory)
                    
                    DataCore.currentTableView?.reloadData()
                    self.navigationController?.popToRootViewControllerAnimated(true)
                    
                                    } else {
                    
                    print("Process Failed")
                    
                }
                
        }

        
        
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
