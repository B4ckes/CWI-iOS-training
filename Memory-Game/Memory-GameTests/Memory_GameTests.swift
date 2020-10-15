//
//  Memory_GameTests.swift
//  Memory-GameTests
//
//  Created by Lucas Eduardo Backes on 10/10/20.
//

import XCTest
import Quick
import Nimble

@testable import Memory_Game

class Memory_GameTests: QuickSpec {
    override func spec() {
        let testCards: [String] = [
            "Dwarf",
            "Elv",
            "Witch",
            "Wizard",
            "Knight",
            "Witch",
            "Elv",
            "Dwarf",
            "Knight",
            "Wizard",
        ]
        
        var currentGame: MemoryGame!
        
        beforeEach {
            currentGame = MemoryGame(shuffledCards: testCards)
        }
    
        describe("has started a game") {
            context("has initialized game model") {
                it("has to have correct initial parameters") {
                    expect(currentGame.cards.count).to(equal(10))
                    expect(currentGame.firstAttemptCard).to(equal(""))
                    expect(currentGame.hasWinned).to(beFalse())
                    expect(currentGame.pairsFound.count).to(equal(0))
                    expect(currentGame.shouldUnflipCards).to(beFalse())
                    expect(currentGame.totalAttempts).to(equal(0))
                }
            }
        }

        describe("when played normally") {
            context("flip the first card") {
                it("should be in firstAttemptCard variable") {
                    currentGame.attempt(cardName: testCards[0])
                    
                    expect(currentGame.firstAttemptCard).to(equal(testCards[0]))
                }
            }

            context("found a pair") {
                it("should have a correct pair in the array") {
                    currentGame.attempt(cardName: testCards[0])
                    currentGame.attempt(cardName: testCards[7])
                    
                    expect(currentGame.pairsFound.count).to(equal(1))
                    expect(currentGame.totalAttempts).to(equal(1))
                }
            }

            context("selected a wrong pair") {
                it("should not append on pairsFound") {
                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[2])
                    
                    expect(currentGame.pairsFound.count).to(equal(0))
                }
            }
            
            context("selected two wrong pairs") {
                it("should append on totalAttempts") {
                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[2])

                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[9])
                    
                    expect(currentGame.totalAttempts).to(equal(2))
                }
            }
            
            context("selected two wrong pairs") {
                it("should clear firstAttemptCard") {
                    currentGame.attempt(cardName: testCards[1])
                    
                    expect(currentGame.firstAttemptCard).to(equal(testCards[1]))
                    
                    currentGame.attempt(cardName: testCards[2])
                    
                    expect(currentGame.firstAttemptCard).to(equal(""))
                }
            }

            context("found all pairs") {
                it("should win game") {
                    currentGame.attempt(cardName: testCards[0])
                    currentGame.attempt(cardName: testCards[7])

                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[6])
                    
                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[5])
                    
                    currentGame.attempt(cardName: testCards[3])
                    currentGame.attempt(cardName: testCards[9])
                    
                    currentGame.attempt(cardName: testCards[4])
                    currentGame.attempt(cardName: testCards[8])
                    
                    expect(currentGame.hasWinned).to(beTrue())
                }
            }
            
            context("found all pairs") {
                it("should have correct total attempts") {
                    currentGame.attempt(cardName: testCards[0])
                    currentGame.attempt(cardName: testCards[7])

                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[6])
                    
                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[5])
                    
                    currentGame.attempt(cardName: testCards[3])
                    currentGame.attempt(cardName: testCards[9])
                    
                    currentGame.attempt(cardName: testCards[4])
                    currentGame.attempt(cardName: testCards[8])
                    
                    expect(currentGame.totalAttempts).to(equal(5))
                }
            }
            
            context("found all pairs but with some errors") {
                it("should win game") {
                    currentGame.attempt(cardName: testCards[0])
                    currentGame.attempt(cardName: testCards[7])

                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[5])

                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[6])
                    
                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[8])
                    
                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[5])
                    
                    currentGame.attempt(cardName: testCards[3])
                    currentGame.attempt(cardName: testCards[8])
                    
                    currentGame.attempt(cardName: testCards[3])
                    currentGame.attempt(cardName: testCards[9])
                    
                    currentGame.attempt(cardName: testCards[4])
                    currentGame.attempt(cardName: testCards[8])
                    
                    expect(currentGame.hasWinned).to(beTrue())
                }
            }
            
            context("found all pairs but with some errors") {
                it("should have correct totalAttempts") {
                    currentGame.attempt(cardName: testCards[0])
                    currentGame.attempt(cardName: testCards[7])

                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[5])

                    currentGame.attempt(cardName: testCards[1])
                    currentGame.attempt(cardName: testCards[6])
                    
                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[8])
                    
                    currentGame.attempt(cardName: testCards[2])
                    currentGame.attempt(cardName: testCards[5])
                    
                    currentGame.attempt(cardName: testCards[3])
                    currentGame.attempt(cardName: testCards[8])
                    
                    currentGame.attempt(cardName: testCards[3])
                    currentGame.attempt(cardName: testCards[9])
                    
                    currentGame.attempt(cardName: testCards[4])
                    currentGame.attempt(cardName: testCards[8])
                    
                    expect(currentGame.totalAttempts).to(equal(8))
                }
            }
        }
    }
}
