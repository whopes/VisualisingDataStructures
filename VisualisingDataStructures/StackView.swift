//
//  ContentView.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 15/03/2023.
//

import SwiftUI

struct StackView: View {
    @StateObject var stack = Stack(size: 10)
    @State var data = ""
    @State var popped = ""
    @State var peek = ""
    @State var displayed = ""
    
    var stack_is_full: Bool {
        return stack.tail < stack.stack.count - 1 ? false : true
    }
    var stack_is_empty: Bool {
        return stack.tail == -1 ? true : false
    }
    
    var body: some View {
        VStack {
            
            TextField("Enter data", text: $data)
                
            
            HStack {
                ForEach(stack.stack, id: \.self.place) { stackItem in
                    Text(stackItem.name ?? "")
                }
            }
            .padding(.bottom, 20)
            VStack {
                Text("Popped: \(popped)")
                Text("Peek: \(peek)")
                Text("Stack: \(displayed)")
            }
            
            VStack {
                Button("Push to stack", action: {
                    stack.push(data: data)
                    data = ""
                })
                    .disabled(stack_is_full)
                
                Button("Pop From stack", action: {
                    popped = ""
                    popped = stack.pop()
                    peek = ""
                    displayed = ""
                    })
                
                Button("Peek top of stack", action: { peek = stack.peek() })
                
                Button("Display stack", action: { displayed = stack.display() })
                    .disabled(stack_is_empty)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
