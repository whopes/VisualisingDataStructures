//
//  RootTabView.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 19/03/2023.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            StackView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Stack")
                }
            QueueView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Queue")
                }
            LinkedListView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Linked list")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
