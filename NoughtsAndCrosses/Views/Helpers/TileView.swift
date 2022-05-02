//
//  TileView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-02.
//

import SwiftUI

struct TileView: View {
    
    // MARK: Stored properties
    @Binding var state: String
    @Binding var player: String
    
    // MARK: Computed properties
    var body: some View {
        Text(state)
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .border(.foreground, width: 3)
            .padding(5)
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(state: .constant(nought),
                 player: .constant(cross))
        TileView(state: .constant(cross),
                 player: .constant(nought))
        TileView(state: .constant(""),
                 player: .constant(nought))
    }
}
