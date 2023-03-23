//
//  Queue.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 19/03/2023.
//

import Foundation

class Queue: ObservableObject {
    @Published var queue: [Item] = []
    var head: Int
    var tail: Int
    
    init(size: Int) {
        self.tail = -1
        self.head = 0
        for i in 0 ..< size {
            self.queue.append(Item(nil, i))
        }
    }
    
    func push(data: String) {
        if self.head == (self.tail + 1) && self.tail != -1 && self.queue[self.head + 1].name != nil {
            
        } else if self.head < self.queue.count {
            self.queue[self.head].name = data
            self.head += 1
        } else {
            self.queue[0].name = data
            self.head = 1
        }
    }
    
    func pop() -> String {
            if self.tail < (self.queue.count - 1) {
                if self.queue[self.tail + 1].name != nil {
                    self.tail += 1
                    let data = self.queue[self.tail].name
                    self.queue[self.tail].name = nil
                    return data ?? "nil"
                } else {
                    return "Can't pop nothing"
                }
            } else {
                if self.queue[0].name != nil {
                    self.tail = 0
                    let data = self.queue[self.tail].name
                    self.queue[self.tail].name = nil
                    return data ?? "nil"
                } else {
                    return "Can't pop nothing"
                }
            }
    }
    
    func display() -> String {
        var display_array = ["\(self.queue[0].name ?? "")"]
        for i in 1 ..< self.queue.count {
            let item = self.queue[i]
            if item.name != nil {
                display_array.append("\(item.name!)")
            }
        }
        let displayed = display_array.joined(separator: ", ")
        return displayed
    }
}
