//
//  Functions.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 08/10/20.
//

import Foundation

func replaceChar(_ char: String, on maskedWord: String, with word: String) -> String {
    let charToReplace = Character(char)
    var result = maskedWord
    
    for index in word.indices {
        if word[index] == charToReplace {
            result.remove(at: index)
            result.insert(charToReplace, at: index)
        }
    }
    
    return result
}
