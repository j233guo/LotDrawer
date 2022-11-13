//
//  Drawer649.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import SwiftUI

struct Drawer649: View {
    @State private var selections: [Int] = []
    
    func pick() {
        selections = []
        while selections.count < 6 {
            var currPick = Int.random(in: 1...49)
            while selections.contains(currPick) {
                currPick = Int.random(in: 1...49)
            }
            selections.append(currPick)
        }
    }
    
    let gridItems = [
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
        GridItem(.fixed(UIScreen.main.bounds.width/10)),
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridItems) {
                ForEach(1..<50) { i in
                    DrawNumberLabel(selected: selections.contains(i), number: i, backgroundColor: Color.blue)
                }
            }
            .padding()
            .padding(.top, 100)
            Button {
                pick()
            } label: {
                DrawButtonLabel()
            }
            .padding(.vertical)
            Spacer()
        }
        .navigationBarTitle("649")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Drawer649_Previews: PreviewProvider {
    static var previews: some View {
        Drawer649()
    }
}
