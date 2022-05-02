//
//  GameBoardView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-02.
//

import SwiftUI

struct GameBoardView: View {
    
    // MARK: Stored properties
    // Game board state, all nine positions
    @State var upperLeft = ""
    @State var upperMiddle = ""
    @State var upperRight = ""
    @State var middleLeft = ""
    @State var middleMiddle = ""
    @State var middleRight = ""
    @State var lowerLeft = ""
    @State var lowerMiddle = ""
    @State var lowerRight = ""
    
    // Tracks the overall number of turns
    // Game over after 9 turns, or when a player wins
    @State var currentTurn = 1
    
    // Which player's turn is it?
    @State var currentPlayer = nought
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            Spacer()
            
            // The game board views
            VStack {
                
                HStack {
                    Spacer()
                    
                    TileView(state: $upperLeft,
                             player: $currentPlayer,
                             turn: $currentTurn)

                    TileView(state: $upperMiddle,
                             player: $currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $upperRight,
                             player: $currentPlayer,
                             turn: $currentTurn)

                    Spacer()
                }

                HStack {
                    Spacer()
                    
                    TileView(state: $middleLeft,
                             player: $currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $middleMiddle,
                             player: $currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $middleRight,
                             player: $currentPlayer,
                             turn: $currentTurn)

                    Spacer()
                }

                HStack {
                    Spacer()
                    
                    TileView(state: $lowerLeft,
                             player: $currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $lowerMiddle,
                             player: $currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $lowerRight,
                             player: $currentPlayer,
                             turn: $currentTurn)

                    Spacer()
                }

            }
            
            Spacer()
            
            Text("Turn is: \(currentTurn)")
            
            Spacer()
            
            Text("Current player is: \(currentPlayer)")

            Spacer()
        }
        .onChange(of: currentTurn) { newValue in
            print("Hello, it is now turn \(newValue)")
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
