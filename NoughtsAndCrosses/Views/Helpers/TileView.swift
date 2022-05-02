//
//  TileView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-02.
//

import SwiftUI

struct TileView: View {
    
    // MARK: Stored properties
    let state: String
    
    // MARK: Computed properties
    var body: some View {
        Text(state)
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .border(.foreground, width: 3)
            .padding()
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(state: nought)
        TileView(state: cross)
        TileView(state: "")
    }
}
