//
//  CharacterDetailsViewTests.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 20/12/22.
//

import XCTest
@testable import StoneChallenge

final class CharacterDetailsViewTests: XCTestCase {
    func testLoadCharacterDetails() {
        let sut = CharacterDetailsView()
        let character = Character(id: 1, name: "Rick", status: "alive", species: "human", type: "human", gender: "masculine", image: "aliveIcon")
        
        sut.loadCharacterDetails(character: character)
        
        XCTAssertTrue(sut.typeLabel.text == "TYPE: \(character.type)")
        XCTAssertTrue(sut.statusLabel.text == "STATUS: \(character.status)")
        XCTAssertTrue(sut.genderLabel.text == "GENDER: \(character.gender)")
        XCTAssertTrue(sut.specieLabel.text == "SPECIE: \(character.species)")
    }

}
