//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 15/03/2023.
//

import Foundation

class Stack {
    var stack: [String?]
    var tail: Int
    
    init(size: Int) {
        self.stack = [String?](repeating: nil, count: size)
        self.tail = -1
    }
    
    func push(data: String) {
        self.tail += 1
        self.stack[self.tail] = data
    }
    
    func pop() -> String {
        if self.tail > -1 {
            let data = self.stack[self.tail]
            self.stack[self.tail] = nil
            self.tail -= 1
            return data!
        } else {
            return "There is nothing left in the stack"
        }
    }
    
    func peek() -> String {
        if self.tail > -1 {
            return self.stack[self.tail]!
        } else {
            return "There is nothing in the stack"
        }
    }
    
    func display() -> String {
        var display_array = ["\(self.stack[0]!)"]
        for i in 1 ..< self.stack.count {
            let item = self.stack[i]
            if item != nil {
                display_array.append("\(item!)")
            }
        }
        let displayed = display_array.joined(separator: ", ")
        return displayed
    }
}
