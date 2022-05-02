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
    
    // Whether the current game has been won or not
    @State var gameWon = false
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            Spacer()
            
            // The game board views
            VStack {
                
                HStack {
                    Spacer()
                    
                    TileView(state: $upperLeft,
                             player: currentPlayer,
                             turn: $currentTurn)
                    
                    TileView(state: $upperMiddle,
                             player: currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $upperRight,
                             player: currentPlayer,
                             turn: $currentTurn)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    TileView(state: $middleLeft,
                             player: currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $middleMiddle,
                             player: currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $middleRight,
                             player: currentPlayer,
                             turn: $currentTurn)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    TileView(state: $lowerLeft,
                             player: currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $lowerMiddle,
                             player: currentPlayer,
                             turn: $currentTurn)
                    TileView(state: $lowerRight,
                             player: currentPlayer,
                             turn: $currentTurn)
                    
                    Spacer()
                }
                
            }
            
            Spacer()
            
            // Print turn, or whether game is won
            Text(gameWon ? "\(currentPlayer) wins" : "Turn is: \(currentTurn)")
            
            Spacer()
            
            Text("Current player is: \(currentPlayer)")
            // Only show when game is not over
            .opacity(!gameWon ? 1.0 : 0.0)

            Button(action: {
                
                upperLeft = ""
                upperMiddle = ""
                upperRight = ""
                middleLeft = ""
                middleMiddle = ""
                middleRight = ""
                lowerLeft = ""
                lowerMiddle = ""
                lowerRight = ""
                
                gameWon = false
                currentTurn = 1
                currentPlayer = nought
                
            }, label: {
                Text("New Game")
            })
            // Only show when game is over
            .opacity(gameWon ? 1.0 : 0.0)
            
            Spacer()
        }
        .onChange(of: currentTurn) { newValue in
            print("Hello, it is now turn \(newValue)")
            
            // Has somebody won?
            checkForWin()
            
        }
    }
    
    // MARK: Functions
    func checkForWin() {
        
        // Win across top
        if
            upperLeft == currentPlayer &&
                upperMiddle == currentPlayer &&
                upperRight == currentPlayer ||

                middleLeft == currentPlayer &&
                middleMiddle == currentPlayer &&
                middleRight == currentPlayer ||

                lowerLeft == currentPlayer &&
                lowerMiddle == currentPlayer &&
                lowerRight == currentPlayer ||

                upperLeft == currentPlayer &&
                middleLeft == currentPlayer &&
                lowerLeft == currentPlayer ||

                upperMiddle == currentPlayer &&
                middleMiddle == currentPlayer &&
                lowerMiddle == currentPlayer ||

                upperRight == currentPlayer &&
                middleRight == currentPlayer &&
                lowerRight == currentPlayer ||

                upperLeft == currentPlayer &&
                middleMiddle == currentPlayer &&
                lowerRight == currentPlayer ||

                upperRight == currentPlayer &&
                middleMiddle == currentPlayer &&
                lowerLeft == currentPlayer
        {
            
            gameWon = true
            return
            
        }
        
        // Nobody won, change the current player
        if currentPlayer == nought {
            currentPlayer = cross
        } else {
            currentPlayer = nought
        }
        
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
