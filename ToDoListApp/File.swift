//
//  File.swift
//  ToDoListApp
//
//  Created by Aljona Samuelsson on 2021-10-27.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
    //Add more tasks
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
