//
//  GameController.swift
//  Memory-Game
//
//  Created by Lucas Eduardo Backes on 11/10/20.
//

import UIKit

class GameController {
    var totalAttempts: Int
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
    private(set) var hasWinned: Bool = false
    private(set) var pairsFound: [String] = [] {
        didSet {
            if pairsFound.count == 5 {
                hasWinned = true
            }
        }
    }
    
    internal init() {
        self.totalAttempts = 0
        self.pairsFound = []
        self.firstAttemptCard = ""
        self.shouldUnflipCards = false
        
        self.cards.shuffle()
    }
    
    func attempt(cardName card: String, button cardButton: UIButton) {
        if firstAttemptCard == "" {
            firstAttemptCard = card
            return
        }
        
        if firstAttemptCard == card {
            totalAttempts += 1
            pairsFound.append(card)
            firstAttemptCard = ""
        } else {
            totalAttempts += 1
            firstAttemptCard = ""
            shouldUnflipCards = true
        }
    }
}
