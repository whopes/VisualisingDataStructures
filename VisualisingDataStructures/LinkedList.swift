//
//  LinkedList.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 22/03/2023.
//

import Foundation


class Element: Identifiable {
    @Published var data: String
    @Published var pointer: Element?
    
    init(_ name: String, _ pointer: Element? = nil){
        self.data = name
        self.pointer = pointer
    }
}

class Linked_list: ObservableObject {
    var head: Element?
    var list: [Element]
    
    init() {
        self.list = []
    }
    
    func add(name: String) {
        if name != "" {
            let element = Element(name)
            
            if self.head == nil {
                self.head = element
                list.append(element)
            } else {
                if let current = self.head!.pointer {
                    if name < self.head!.data {
                        element.pointer = self.head!
                        self.head = element
                        list.append(element)
                    } else if name < current.data {
                        element.pointer = current
                        self.head!.pointer = element
                        list.append(element)
                    } else {
                        var next = current
                        var previous = self.head!
                        while next.data < name {
                            if let new = next.pointer {
                                previous = next
                                next = new
                            } else {
                                next.pointer = element
                                break
                            }
                    }
                        element.pointer = next
                        previous.pointer = element
                        list.append(element)
                    }
             }
                if self.head!.pointer == nil {
                    if self.head!.data < name {
                        self.head!.pointer = element
                        list.append(element)
                    } else {
                        element.pointer = self.head
                        self.head = element
                        list.append(element)
                    }
                }
            }
        }
    }
    
    func delete(element: String) {
        var in_list = false
        for i in self.list {
            if i.data == element {
                in_list = true
            }
        }
        if in_list {
            if let head = self.head {
                if head.data != element {
                    if let first = head.pointer {
                        var current = first
                        var previous = head
                        while current.data != element {
                            if let next = current.pointer {
                                previous = current
                                current = next
                            } else {
                                break
                            }
                        }
                        let item_to_delete = current
                        previous.pointer = item_to_delete.pointer
                        for i in 0..<list.count {
                            let thing = list[i]
                            if thing.data == element {
                                list.remove(at: i)
                                break
                            }
                        }
                    }
                } else {
                    if let new_head = head.pointer {
                        self.head = new_head
                    } else {
                        self.head = nil
                    }
                    list.remove(at: 0)
                }
            }
        }
    }
    
    func traverse() -> String {
        var array: [String] = []
        if let first = self.head {
          var current: Element? = first
          while current != nil {
            array.append(current!.data)
            current = current!.pointer
          }
        }
        if array.count != 0 {
            let displayed = array.joined(separator: ", ")
            return displayed
        } else {
            return "List is empty"
        }
      }
}
