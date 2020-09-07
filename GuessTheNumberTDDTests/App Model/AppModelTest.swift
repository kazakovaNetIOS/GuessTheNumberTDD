//
//  AppModelTest.swift
//  GuessTheNumberTDDTests
//
//  Created by Natalia Kazakova on 07.09.2020.
//  Copyright © 2020 Natalia Kazakova. All rights reserved.
//

import XCTest
@testable import GuessTheNumberTDD

class AppModelTest: XCTestCase {
    
    var sut: AppModel!

    override func setUp() {
        super.setUp()
        
        sut = AppModel()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Guessed number
    
    func testAppModel_whenInitialized_guessedNumberIsSet() {
        // when
        let guessedNumber = sut.number
        
        // then
        XCTAssertNotNil(guessedNumber)
    }
    
    func testAppModel_whenInitialized_guessedNumberIsGreaterThanOrEqualOne() {
        // when
        let guessedNumber = sut.number
        
        // then
        XCTAssertGreaterThanOrEqual(guessedNumber, 1)
    }
    
    func testAppModel_whenInitialized_guessedNumberIsLessThanOrEqualTen() {
        // when
        let guessedNumber = sut.number
        
        // then
        XCTAssertLessThanOrEqual(guessedNumber, 10)
    }
    
    // MARK: - Attempts Number
    
    func testAppModel_whenInitialized_attemptsNumberIsSet() {
        // when
        let attemptsNumber = sut.attemptsNumber
        
        // then
        XCTAssertNotEqual(attemptsNumber, 0)
    }
    
    func testAppModel_whenInitialized_attemptsNumberIsEqualThree() {
        // when
        let attemptsNumber = sut.attemptsNumber
        
        // then
        XCTAssertEqual(attemptsNumber, 3)
    }
    
    // MARK: - Processed Result
    
    func testAppModel_whenNumberEntered_attemptsNumberDecremented() {
        // given
        let enteredNumber = 5
        
        // when
        _ = sut.processingNumber(enteredNumber)
        
        // then
        XCTAssertEqual(sut.attemptsNumber, 2)
    }
    
    func testAppModel_whenNumberIsGreater_returnGreaterResult() {
        // given
        let enteredNumber = 8
        sut.number = 6
        
        // when
        let processResult = sut.processingNumber(enteredNumber)
        
        // then
        XCTAssertEqual(processResult, ProcessResult.greater)
    }
    
    func testAppModel_whenNumberIsLess_returnLessResult() {
        // given
        let enteredNumber = 4
        sut.number = 6
        
        // when
        let processResult = sut.processingNumber(enteredNumber)
        
        // then
        XCTAssertEqual(processResult, ProcessResult.less)
    }
    
    func testAppModel_whenNumberIsEqual_returnEqualResult() {
        // given
        let enteredNumber = 6
        sut.number = 6
        
        // when
        let processResult = sut.processingNumber(enteredNumber)
        
        // then
        XCTAssertEqual(processResult, ProcessResult.equal)
    }
    
    func testAppModel_whenAttemptsNumberIsZero_returnAttemptsEndedResult() {
        // given
        let enteredNumber = 6
        sut.attemptsNumber = 1
        
        // when
        let processResult = sut.processingNumber(enteredNumber)
        
        // then
        XCTAssertEqual(processResult, ProcessResult.attemptsEnded)
    }
    
    // MARK: - Restart
    
    func testAppModel_whenRestart_attemptsNumberUpdated() {
        // given
        sut.attemptsNumber = 0
        
        // when
        sut.restart()
        
        // then
        XCTAssertEqual(sut.attemptsNumber, 3)
    }
    
    func testAppModel_whenRestart_guessedNumberUpdated() {
        // when
        sut.restart()
        
        // then
        XCTAssertNotEqual(sut.number, 0)
    }
}
