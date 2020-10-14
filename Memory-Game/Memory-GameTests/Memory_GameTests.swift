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

class Memory_GameTests: XCTestCase {
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
        
        beforeEach {
            var game = MemoryGame(shuffledCards: testCards)
        }
    }
    
    describe("when played normally") {
        context("found a correct pair") {
            it("should have one found pair") {
                game.
            }
        }
    }
}
