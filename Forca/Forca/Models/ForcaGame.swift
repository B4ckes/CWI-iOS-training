//
//  forcaGame.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 08/10/20.
//

import Foundation

class ForcaGame {

    let word: String
    let hint: String
    let maxMissedAttemps = 5

    private(set) var maskedWord: String
    private(set) var attemptHistory: [String] = []
    private(set) var hasLost = false
    private(set) var hasWinned = false
    private(set) var missedAttempts: Int = 0 {
        didSet {
            if missedAttempts > maxMissedAttemps {
                hasLost = true
            }
        }
    }
    
    internal init(word: String, hint: String) {
        self.word = word.comparable
        self.hint = hint
        self.maskedWord = word.map { _ in "_" }.joined()
    }
    
    func attempt(char: String) {
        guard let informedChar = char.first?.comparable else { return }
        
        if attemptHistory.contains(informedChar) {
            return
        }
        
        attemptHistory.append(informedChar)
        
        guard word.contains(informedChar) else {
            missedAttempts += 1

            return
        }
        
        maskedWord = replaceChar(informedChar, on: maskedWord, with: word)
        
        if word == maskedWord {
            hasWinned = true
        }
    }
}
