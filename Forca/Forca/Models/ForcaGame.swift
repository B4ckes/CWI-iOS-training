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
        self.word = word
        self.hint = hint
        self.maskedWord = word.map { _ in "_" }.joined()
    }
    
    func attempt(char: String) {
        if attemptHistory.contains(char) {
            return
        }
        
        attemptHistory.append(char)
        
        guard word.contains(char) else {
            missedAttempts += 1

            return
        }
        
        maskedWord = replaceChar(char, on: maskedWord, with: word)
    }
}
