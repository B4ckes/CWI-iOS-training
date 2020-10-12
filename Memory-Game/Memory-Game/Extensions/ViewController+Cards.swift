//
//  Cards.swift
//  Memory-Game
//
//  Created by Lucas Eduardo Backes on 11/10/20.
//

import UIKit

extension ViewController {
    func flipCard(button: UIButton, image: String) {
        button.setImage(UIImage(named: image), for: .normal)
    }

    func flipBackWrongPair() {
        for button in self.flippedCards {
            self.flipCard(button: button, image: "Card")

            self.enableButton(button)
        }
    }
    
    func verifyWrongPairs() {
        let maxFlippedCards: Int = 2
        isAbleToPlay = false
        
        if currentGame.shouldUnflipCards && flippedCards.count == maxFlippedCards {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.flipBackWrongPair()
                self.flippedCards = []

                self.isAbleToPlay = true
            }
            
            currentGame.shouldUnflipCards = false
            return
        } else if flippedCards.count == maxFlippedCards {
            flippedCards = []
        }
        
        isAbleToPlay = true
    }
    
    func resetCards() {
        let buttons: [UIButton] = [
            button0Outlet,
            button1Outlet,
            button2Outlet,
            button3Outlet,
            button4Outlet,
            button5Outlet,
            button6Outlet,
            button7Outlet,
            button8Outlet,
            button9Outlet,
        ]
        
        for button in buttons {
            flipCard(button: button, image: "Card")
            button.isUserInteractionEnabled = true
        }
    }
}
