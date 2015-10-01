//
//  TableViewController.swift
//  Memorable Places
//
//  Created by BEATRIZ MACEDO on 9/30/15.
//  Copyright © 2015 Beatriz Macedo. All rights reserved.
//

import UIKit

var places = [Dictionary<String,String>()]

var activePlace = -1

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        retriveStorage()
        
        if places.count == 1 {
            
            places.removeAtIndex(0)
            
            places.append(["name":"Eiffel Tower","lat":"48.8582", "lon": "2.2945"])
            print(places)
            
            saveStorage()
            
        }
        
        print("load tableview")

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = places[indexPath.row]["name"]
        print(cell.textLabel?.text)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        activePlace = indexPath.row
        print("Active Place: \(activePlace)")
        
        return indexPath
    }
    
    // When opening table view, reloads the places saved on array
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view segues
    
    // Segue to see map
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "newPlace" {
            activePlace = -1
        }
    }
    
    
    // MARK: - Table view options
    
    // Delete Option
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            places.removeAtIndex(indexPath.row)
            
            saveStorage()
            
            tableView.reloadData()
            
            
        }
    }
    
    // MARK: - Table view storage
    
    func saveStorage() {
        let userStorage = NSUserDefaults.standardUserDefaults()
        userStorage.setObject(places, forKey: "places")
    }
    
    func retriveStorage() {
        let userStorage = NSUserDefaults.standardUserDefaults()
        
        if userStorage.objectForKey("places") != nil {
            places = userStorage.objectForKey("places") as! [Dictionary<String,String>]
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
