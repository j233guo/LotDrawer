//
//  DrawerLottoMax.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import SwiftUI

struct DrawerLottoMax: View {
    @State private var selections: [Int] = []
    
    func pick() {
        selections = []
        while selections.count < 7 {
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
                ForEach(1..<51) { i in
                    DrawNumberLabel(selected: selections.contains(i), number: i, backgroundColor: Color.green)
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
        .navigationBarTitle("Lotto Max")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DrawerLottoMax_Previews: PreviewProvider {
    static var previews: some View {
        DrawerLottoMax()
    }
}
