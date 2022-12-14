//
//  StoneChallengeTests.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 13/12/22.
//

import XCTest
@testable import StoneChallenge

final class StoneChallengeTests: XCTestCase {

    var sut: HomeViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    
    func testDefineImageStatusAlive() {
        //Given
        let sut = HomeViewController()
        let status = ""
        //When
        let statusReturn = sut.defineImageStatus(status: status)
        //Then
        XCTAssertTrue(statusReturn == "aliveIcon")
    }
    func testDefineImageStatus() throws {
        var imageStatus = ""

        imageStatus = sut.defineImageStatus(status: "Dead")
        XCTAssertEqual(imageStatus, "deadIcon")

        imageStatus = sut.defineImageStatus(status: "Alive")
        XCTAssertEqual(imageStatus, "aliveIcon")

        imageStatus = sut.defineImageStatus(status: "Unknown")
        XCTAssertEqual(imageStatus, "unknownIcon")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
