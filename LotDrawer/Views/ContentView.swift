//
//  ContentView.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import SwiftUI

enum Tab {
    case lunch, lottery
}

struct ContentView: View {
    @State private var selectedTab = Tab.lunch
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LunchDrawer()
                .tabItem {
                    Label("Lunch", systemImage: "takeoutbag.and.cup.and.straw")
                }
                .tag(Tab.lunch)
            LotteryDrawer()
                .tabItem {
                    Label("Lottery", systemImage: "dollarsign.circle.fill")
                }
                .tag(Tab.lottery)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
