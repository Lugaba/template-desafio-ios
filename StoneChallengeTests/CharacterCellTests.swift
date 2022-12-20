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
    
    func testSetupImage() {
        //Given
        let sut = CharacterCollectionViewCell()
        let image = UIImage()
        
        //When
        sut.setupImage(image: image)
        
        //Then
        XCTAssertTrue(sut.imageView.image == image)
        
    }
    
    func testSetupCell() {
        //Given
        let sut = CharacterCollectionViewCell()
        let character = Character(id: 1, name: "Rick", status: "alive", species: "human", type: "human", gender: "masculine", image: "aliveIcon")
        
        //When
        sut.setupCell(character: character)
        
        //Then
        XCTAssertTrue(sut.nameLabel.text == character.name)
        XCTAssertTrue(sut.specieLabel.text == character.species)

    }
}
