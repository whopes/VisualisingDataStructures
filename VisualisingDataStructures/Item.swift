//
//  Item.swift
//  VisualisingDataStructures
//
//  Created by Hopes, William (AMM) on 19/03/2023.
//

import Foundation

class Item: Identifiable {
    @Published var name: String?
    let place: Int
    
    init(_ data: String?, _ place: Int) {
        self.name = data
        self.place = place
    }
}
