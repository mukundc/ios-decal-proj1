//
//  StatsController.swift
//  ToDoList
//
//  Created by Mukund Chillakanti on 2/28/16.
//  Copyright © 2016 Mukund Chillakanti. All rights reserved.
//

import UIKit

class StatsController: UIViewController {

    @IBOutlet weak var countCompleted: UILabel!
    var countCompletedInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countCompleted.text = String(countCompletedInt)
        // Do any additional setup after loading the view, typically from a nib.
    }


}
