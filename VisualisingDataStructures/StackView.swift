//
//  ContentView.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var stack = Stack(size: 10)
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
                .padding(.bottom, 240)
                
            
            VStack {
                Text("Popped: \(popped)")
                Text("Peek: \(peek)")
                Text("Stack: \(displayed)")
            }
            .font(.system(size: 20))
            
            VStack {
                Button("Push to Stack", action: {
                    stack.push(data: data)
                    data = ""
                })
                    .disabled(stack_is_full)
                
                Button("Pop From Stack", action: { popped = stack.pop() })
                
                Button("Peek top of stack", action: { peek = stack.peek() })
                
                Button("Display stack", action: { displayed = stack.display() })
                    .disabled(stack_is_empty)
            }
            .padding(.top, 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
