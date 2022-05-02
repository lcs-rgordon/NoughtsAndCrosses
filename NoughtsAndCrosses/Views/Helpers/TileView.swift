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
    @Binding var turn: Int
    
    // MARK: Computed properties
    var body: some View {
        Text(state)
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .border(.foreground, width: 3)
            .padding(5)
            .onTapGesture {
                
                print("inside tile")
                
                // Only continue if state of this tile
                // is empty
                // (disregard tap if tile already filled)
                guard state == "" else {
                    return
                }
                
                // Now, fill tile with symbol for current player
                state = player
                
                // Change the current player for next turn
                if player == nought {
                    player = cross
                } else {
                    player = nought
                }
                
                // Move to next turn
                turn += 1
            }
    }
    
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(state: .constant(nought),
                 player: .constant(cross),
                 turn: .constant(1))
        TileView(state: .constant(cross),
                 player: .constant(nought),
                 turn: .constant(1))
        TileView(state: .constant(""),
                 player: .constant(nought),
                 turn: .constant(1))
    }
}
