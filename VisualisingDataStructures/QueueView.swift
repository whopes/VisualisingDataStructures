//
//  QueueView.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 19/03/2023.
//

import SwiftUI

struct QueueView: View {
    @StateObject var queue = Queue(size: 10)
    @State var data = ""
    @State var popped = ""
    @State var displayed = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter data", text: $data)
                
            HStack {
                ForEach(queue.queue, id: \.self.place) { queueItem in
                    Text(queueItem.name ?? "")
                }
            }
            VStack {
                Text("Tail index: \(queue.tail)")
                Text("Head index: \(queue.head)")
                Text("Popped: \(popped)")
                Text("Stack: \(displayed)")
            }
            
            VStack {
                Button("Push to queue", action: {
                    queue.push(data: data)
                    data = ""
                })
                
                Button("Pop From queue", action: {
                    popped = ""
                    popped = queue.pop()
                    displayed = ""
                })
                
                Button("Display queue", action: { displayed = queue.display() })
            }
        }
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
