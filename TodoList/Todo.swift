//
//  Todo.swift
//  TodoList
//
//  Created by Noah Braunfeld on 2/26/20.
//  Copyright © 2020 Noah Braunfeld. All rights reserved.
//

import UIKit

struct Todo: Codable {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func loadTodos() -> [Todo]? {
        guard let codedTodos = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode(Array<Todo>.self, from: codedTodos)
    }
    
    static func saveTodos(_ todos: [Todo]) {
        let propertyListEncoder = PropertyListEncoder()
        
        let codedTodos = try? propertyListEncoder.encode(todos)
        
        try? codedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static func loadSampleTodo() -> [Todo] {
        let todo1 = Todo(title: "Todo 1", isComplete: false, dueDate: Date(), notes: "A note1")
        let todo2 = Todo(title: "Todo 2", isComplete: false, dueDate: Date(), notes: "A note2")
        let todo3 = Todo(title: "Todo 3", isComplete: false, dueDate: Date(), notes: "A note3")
        
        return [todo1, todo2, todo3]
    }
}
