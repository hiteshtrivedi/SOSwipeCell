//
//  TableViewController.swift
//  IOS8SwiftActionsTableViewTutorial
//
//  Created by Arthur Knopper on 18/11/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let arrCity = ["Delhi", "Mumbai", "Chennai", "Kolkata"]
    
    @IBOutlet weak var tblEditing: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCity.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = arrCity[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //1
        let moreAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "More" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 2
            let moreMenu = UIAlertController(title: nil, message: "About City", preferredStyle: .ActionSheet)
            
            let moreOpenAction = UIAlertAction(title: "Know More", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            moreMenu.addAction(moreOpenAction)
            moreMenu.addAction(cancelAction)
            
            self.presentViewController(moreMenu, animated: true, completion: nil)
        })
        moreAction.backgroundColor = UIColor.brownColor()
        
        
        // 3
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 4
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(cancelAction)
            
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        shareAction.backgroundColor = UIColor.lightGrayColor()
        
        // 5
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 6
            let deleteMenu = UIAlertController(title: nil, message: "Remove City", preferredStyle: .ActionSheet)
            
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            deleteMenu.addAction(deleteAction)
            deleteMenu.addAction(cancelAction)
            
            self.presentViewController(deleteMenu, animated: true, completion: nil)
        })
        deleteAction.backgroundColor = UIColor.redColor()
        
        
        // 7
        return [deleteAction, shareAction, moreAction]
    }
}
