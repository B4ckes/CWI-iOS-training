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
            currentGame.attempt(cardName: card)

            flipCard(button: buttonOutlet, image: card)
            flippedCards.append(buttonOutlet)

            disableButton(buttonOutlet)

            verifyCards()
        }
    }
    
    func newGame() {
        currentGame = MemoryGame(shuffledCards: gameCards.shuffled())
    }
    
    func restartGame() {
        resetCards()
        newGame()
    }
    
    func verifyVictory() {
        if currentGame.hasWinned {
            victoryAlert()
        }
    }
    
    func victoryAlert() {
        var action: UIAlertAction {UIAlertAction(title: "Bacana, bora de novo", style: .default) {_ in
            self.restartGame()
        }}
        
        let alert = UIAlertController(
            title: "Boa, você terminou!",
            message: "Você precisou de \(currentGame.totalAttempts) tentativas para finalizar o jogo da memória.",
            preferredStyle: .alert)
        
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
}
