//
//  Obj.swift
//  ToDoList
//
//  Created by Mukund Chillakanti on 2/28/16.
//  Copyright © 2016 Mukund Chillakanti. All rights reserved.
//

import UIKit

class Obj {
    var taskText: String
    var completed: Bool
    var date: Double
    
    init(text: String) {
        self.taskText = text
        self.completed = false
        self.date = 0
    }
}
