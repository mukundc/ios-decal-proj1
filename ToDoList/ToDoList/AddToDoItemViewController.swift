//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Mukund Chillakanti on 2/28/16.
//  Copyright © 2016 Mukund Chillakanti. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var save: UIButton!
    //Have some actions here to update the model
    
    var model = [Obj]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    @IBAction func addTask(sender : UIButton){
        if (text.text != ""){
            model.append(text.text!)
        }
    }*/


}

//self.tableView.reloadData()
