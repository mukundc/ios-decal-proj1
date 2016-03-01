//
//  ViewController.swift
//  ToDoList
//
//  Created by Mukund Chillakanti on 2/28/16.
//  Copyright © 2016 Mukund Chillakanti. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    //1. MODEL
    var model = [Obj]()
    var completedLast24: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print ("making call from view load")
        clear24Hours()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func clear24Hours() {
        for var index = 0; index < self.model.count; ++index {
            //print (NSDate().timeIntervalSince1970 - model[index].date)
            if (model[index].completed && NSDate().timeIntervalSince1970 - model[index].date > 60*60*24) {
                model.removeAtIndex(index)
                tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Fade)
                
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToToDoListTableViewController(segue: UIStoryboardSegue) {
        self.tableView.reloadData()
        //print ("making call from cancel")
        clear24Hours()
    }
    
    @IBAction func unwindSave(segue: UIStoryboardSegue) {
        if let sourceVC = segue.sourceViewController as? AddToDoItemViewController {
            if let taskText = sourceVC.text.text {
                model.append(Obj(text: taskText))
            }
        }
        //print ("making call from save")
        clear24Hours()
        self.tableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToAdd" {
            if let destinationVC = segue.destinationViewController as? AddToDoItemViewController {
                destinationVC.model = self.model
            }
        }
        if segue.identifier == "StatsSegue" {
            if let destinationVC = segue.destinationViewController as? StatsController {
                self.completedLast24 = 0
                for var index = 0; index < self.model.count; ++index {
                    if (model[index].completed && NSDate().timeIntervalSince1970 - model[index].date <= 60*60*24) {
                        self.completedLast24 += 1
                    }
                }
                destinationVC.countCompletedInt = self.completedLast24
                
            }

        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        cell.toDoItemTextLabel.text = model[indexPath.row].taskText
        if model[indexPath.row].completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None

        }
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
            model[indexPath.row].completed = false
        }
        else {
            model[indexPath.row].completed = true
            model[indexPath.row].date = NSDate().timeIntervalSince1970
        }
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            model.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    

}

