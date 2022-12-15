//
//  CharacterCellTests.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 15/12/22.
//

import XCTest
@testable import StoneChallenge

final class CharacterCellTests: XCTestCase {
    func testDefineImageStatusAlive() {
        //Given
        let sut = CharacterCollectionViewCell()
        let status = "Alive"
        
        //When
        let statusReturn = sut.defineImageStatus(status: status)
        
        //Then
        XCTAssertTrue(statusReturn == "aliveIcon")
    }
    
    func testDefineImageStatusDead() {
        //Given
        let sut = CharacterCollectionViewCell()
        let status = "Dead"
        
        //When
        let statusReturn = sut.defineImageStatus(status: status)
        
        //Then
        XCTAssertTrue(statusReturn == "deadIcon")
    }
    
    func testDefineImageStatusUnknown() {
        //Given
        let sut = CharacterCollectionViewCell()
        let status = "Unknown"
        
        //When
        let statusReturn = sut.defineImageStatus(status: status)
        
        //Then
        XCTAssertTrue(statusReturn == "unknownIcon")
    }
}
