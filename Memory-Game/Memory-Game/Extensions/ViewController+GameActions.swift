//
//  ViewController+GameActions.swift
//  Memory-Game
//
//  Created by Lucas Eduardo Backes on 11/10/20.
//

import UIKit

extension ViewController {
    func attempt(cardName card: String, button buttonOutlet: UIButton) {
        if !currentGame.pairsFound.contains(card) && isAbleToPlay {
            currentGame.attempt(cardName: card, button: buttonOutlet)

            flipCard(button: buttonOutlet, image: card)
            flippedCards.append(buttonOutlet)

            disableButton(buttonOutlet)

            verifyWrongPairs()
        }
    }
    
    func restartGame() {
        resetCards()
        currentGame = GameController()
    }
}
