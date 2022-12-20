//
//  FilterViewTests.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 20/12/22.
//

import XCTest
@testable import StoneChallenge

final class FilterViewTests: XCTestCase {
    func testGetValueTextField() {
        let sut = FilterView()
        sut.textField.text = "Rick Morty"
        
        let text = sut.getValueTextField()
        
        XCTAssertTrue(text == "Rick Morty")
        
    }
    
    func testGetStatusSelected() {
        let sut = FilterView()
        sut.statusSelected = "alive"
        
        let status = sut.getStatusSelected()
        
        XCTAssertTrue(status == "alive")
    }
    
    func testSelectButtonAlive() {
        let sut = FilterView()
        
        sut.selectButton(sender: sut.aliveButton)
        
        XCTAssertTrue(sut.statusSelected == "alive")
    }
    
    func testSelectButtonDead() {
        let sut = FilterView()
        
        sut.selectButton(sender: sut.deadButton)
        
        XCTAssertTrue(sut.statusSelected == "dead")
    }
    
    func testSelectButtonUnknow() {
        let sut = FilterView()
        
        sut.selectButton(sender: sut.unknownButton)
        
        XCTAssertTrue(sut.statusSelected == "unknow")
    }
    
    func testSelectButtonDefault() {
        let sut = FilterView()
        let button = UIButton()
        
        sut.selectButton(sender: button)
        
        XCTAssertTrue(sut.statusSelected == "alive")
    }
    
}
