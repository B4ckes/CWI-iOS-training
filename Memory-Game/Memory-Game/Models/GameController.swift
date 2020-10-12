//
//  GameController.swift
//  Memory-Game
//
//  Created by Lucas Eduardo Backes on 11/10/20.
//

import UIKit

class GameController {
    var attempsAmount: Int
    var pairsFound: [String]
    var firstAttemptCard: String
    var shouldUnflipCards: Bool
    
    private(set) var cards: [String] = [
        "Dwarf",
        "Elv",
        "Knight",
        "Witch",
        "Wizard",
        "Dwarf",
        "Elv",
        "Knight",
        "Witch",
        "Wizard",
    ]
    
    internal init() {
        self.attempsAmount = 0
        self.pairsFound = []
        self.firstAttemptCard = ""
        self.shouldUnflipCards = false
        
        self.cards.shuffle()
    }
    
    func attempt(cardName card: String, button cardButton: UIButton) {
        attempsAmount += 1

        if firstAttemptCard == "" {
            firstAttemptCard = card
            return
        }
        
        if firstAttemptCard == card {
            pairsFound.append(card)
            firstAttemptCard = ""
        } else {
            firstAttemptCard = ""
            shouldUnflipCards = true
        }
    }
}
