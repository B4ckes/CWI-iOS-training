//
//  ForcaGameTests.swift
//  ForcaTests
//
//  Created by Lucas Eduardo Backes on 10/10/20.
//

import XCTest
import Quick
import Nimble

@testable import Forca

class ForcaGameTests: QuickSpec {
    override func spec() {
        var forcaGame: ForcaGame!
        
        beforeEach {
            forcaGame = ForcaGame(word: "Jacaré", hint: "Animal")
        }
        
        describe("When played normally") {
            context("on correct letter informed") {
                it("has no error") {
                    forcaGame.attempt(char: "é")
                    
                    expect(forcaGame.missedAttempts).to(equal(.zero))
                    expect(forcaGame.maskedWord).to(equal("_____E"))
                }
            }
            
            context("on wrong letter informed") {
                it("has one error") {
                    forcaGame.attempt(char: "T")
                    
                    expect(forcaGame.missedAttempts).to(equal(1))
                }
            }
            
            context("on wrong character repeat") {
                it("should have 1 error only") {
                    forcaGame.attempt(char: "T")
                    forcaGame.attempt(char: "T")
                    expect(forcaGame.missedAttempts).to(equal(1))
                }
            }
            
            context("when reach max erros") {
                it("has to lose the game") {
                    let attempts = ["X", "Z", "Y", "Q", "H"]
                    
                    for attempt in attempts {
                        forcaGame.attempt(char: attempt)
                    }
                    
                    expect(forcaGame.hasLost).to(beFalse())
                    
                    forcaGame.attempt(char: "K")
                    
                    expect(forcaGame.hasLost).to(beTrue())
                }
            }
            
            context("with a repeated character in the word") {
                it("should update two spaces") {
                    forcaGame.attempt(char: "A")
                    
                    expect(forcaGame.maskedWord).to(equal("_A_A__"))
                }
            }
            
            context("when repeat correct word") {
                it("should not return an error") {
                    forcaGame.attempt(char: "A")
                    forcaGame.attempt(char: "A")
                    
                    expect(forcaGame.missedAttempts).to(equal(.zero))
                    expect(forcaGame.maskedWord).to(equal("_A_A__"))
                }
            }
            
            context("with all correct characters") {
                it("should win") {
                    ["J", "A", "R", "E"].forEach(forcaGame.attempt)
                    
                    expect(forcaGame.hasLost).to(beFalse())
                    expect(forcaGame.hasWinned).to(beFalse())
                    
                    ["X", "I", "Q", "Y", "T", "Ç"].forEach(forcaGame.attempt)
                    
                    expect(forcaGame.hasLost).to(beFalse())
                    expect(forcaGame.hasWinned).to(beTrue())
                }
            }
        }
    }
}
