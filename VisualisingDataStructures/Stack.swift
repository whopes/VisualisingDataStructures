//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 15/03/2023.
//

import Foundation

class Stack: ObservableObject {
    @Published var stack: [Item] = []
    var tail: Int
    
    init(size: Int) {
        self.tail = -1
        for i in 0 ..< size {
            self.stack.append(Item(nil, i))
        }
    }
    
    func push(data: String) {
        self.tail += 1
        self.stack[self.tail].name = data
    }
    
    func pop() -> String {
        if self.tail > -1 {
            let data = self.stack[self.tail].name
            self.stack[self.tail].name = nil
            self.tail -= 1
            return data ?? "nil"
        } else {
            return "There is nothing left in the stack"
        }
    }
    
    func peek() -> String {
        if self.tail > -1 {
            return self.stack[self.tail].name ?? "nil"
        } else {
            return "There is nothing in the stack"
        }
    }
    
    func display() -> String {
        var display_array = ["\(self.stack[0].name ?? "empty")"]
        for i in 1 ..< self.stack.count {
            let item = self.stack[i]
            if item.name != nil {
                display_array.append("\(item.name!)")
            }
        }
        let displayed = display_array.joined(separator: ", ")
        return displayed
    }
}
