//
//  Option.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import Foundation

struct Option: Identifiable {
    var id = UUID()
    var name: String
}

class OptionList: ObservableObject {
    @Published var options: [Option]
    
    init() {
        self.options = []
    }
    
    func add(name: String) {
        let newOption = Option(name: name)
        options.append(newOption)
    }
    
    func remove(at offset: IndexSet) {
        options.remove(atOffsets: offset)
    }
    
    func reset() {
        options = []
    }
    
    func pick(number: Int) -> [Option] {
        var picked = [Option]()
        let shuffledOptions = options.shuffled()
        for i in 0..<number {
            picked.append(shuffledOptions[i])
        }
        return picked
    }
}
