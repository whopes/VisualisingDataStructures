//
//  LinkedListView.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 22/03/2023.
//

import SwiftUI

struct LinkedListView: View {
    @StateObject var linked_list = Linked_list()
    @State var data = ""
    @State var displayed = ""
    @State var to_delete = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter data", text: $data)
            TextField("Item to delete", text: $to_delete)
                
            HStack {
                if linked_list.list.count != 0 {
                    ForEach(linked_list.list) { listItem in
                        Text("\(listItem.data) points to: \(listItem.pointer?.data ?? "nothing")")
                    }
                }
            }
            VStack {
                Text("Head item: \(linked_list.head?.data ?? "")")
                Text("List: \(displayed)")
            }
            
            VStack {
                Button("Add to list", action: {
                    linked_list.add(name: data)
                    data = ""
                })
                
                Button("Delete from list", action: {
                    linked_list.delete(element: to_delete)
                    to_delete = ""
                    displayed = ""
                })
                
                Button("Display list", action: { displayed = linked_list.traverse() })
            }
        }
    }
}

struct LinkedListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedListView()
    }
}
