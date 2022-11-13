//
//  LotteryDrawer.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import SwiftUI

struct LotteryDrawer: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Drawer649()
                } label: {
                    Text("649")
                }
                NavigationLink {
                    DrawerLottoMax()
                } label: {
                    Text("Lotto Max")
                }
            }
            .navigationTitle("Lottery Pickers")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LotteryDrawer_Previews: PreviewProvider {
    static var previews: some View {
        LotteryDrawer()
    }
}
