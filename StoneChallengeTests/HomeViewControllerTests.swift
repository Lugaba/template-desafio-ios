//
//  HomeViewControllerTests.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 15/12/22.
//

import XCTest
@testable import StoneChallenge

final class HomeViewControllerTests: XCTestCase {
    
    func testNavigateToDetails() {
        let sut = HomeViewController()
        let character = Character(id: 1, name: "Rick", status: "alive", species: "human", type: "human", gender: "masculine", image: "aliveIcon")
        
        sut.navigateToDetails(character: character)

    }
}
