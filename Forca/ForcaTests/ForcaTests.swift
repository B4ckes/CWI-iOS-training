//
//  ForcaTests.swift
//  ForcaTests
//
//  Created by Lucas Eduardo Backes on 06/10/20.
//

import XCTest
@testable import Forca

class ForcaTests: XCTestCase {
    func testExample() throws {
        let word = "CAVALO"
        var maskedWord = "______"
        
        maskedWord = replaceChar("V", on: maskedWord, with: word)
        
        XCTAssert(maskedWord == "__V___", maskedWord)
    }
}
