//
//  ContactsTableViewController.swift
//  ContactList
//
//  Created by student on 5/28/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
var x : Array<Array<String>> = [[]]
    override func viewDidLoad() {
                            loadContacts()
                            super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func loadContacts()
    {
        var jsonData = NSData(contentsOfFile: "Users/student/Documents/data.json")
        
        do{
            
            let json = try NSJSONSerialization.JSONObjectWithData(jsonData!, options:NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
            
            print("It worked")
            
            print(json!.allKeys)
            print(json!["cols"] as! Array<String>)
            print(json!["data"] as! Array<Array<String>>)
            x = (json!["data"] as! Array<Array<String>>)
            
            
        }catch {
            print("Error with Json: \(error)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
                return x.count
    }

    
    @IBAction func refreshcontacts(sender: UIRefreshControl) {
        sender.endRefreshing()
        self.loadContacts()
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyContactsTableViewCell

        // Configure the cell...
        
            cell.SetLabel(x[indexPath.row])
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destVC = segue.destinationViewController as? PageInfo {
            destVC.contactDetail = x[tableView.indexPathForSelectedRow!.row]
            destVC.setMyValues()
        }
            
            
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}