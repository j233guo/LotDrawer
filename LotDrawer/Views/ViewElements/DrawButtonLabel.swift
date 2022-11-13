//
//  DrawButtonLabel.swift
//  LotDrawer
//
//  Created by Jiaming Guo on 2022-11-13.
//

import SwiftUI

struct DrawButtonLabel: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 200, height: 50)
            HStack {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
                Text("Pick")
                    .foregroundColor(.white)
                    .font(.title3.bold())
            }
        }
    }
}

struct DrawButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DrawButtonLabel()
    }
}
