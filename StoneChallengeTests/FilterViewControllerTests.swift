//
//  FilterViewControllerTests.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 20/12/22.
//

import XCTest
@testable import StoneChallenge

final class FilterViewControllerTests: XCTestCase {
    func testProtocolReloadCollectionView() {
        let sut = MockReloadCollectionView()
        let viewController = FilterViewController()
        
        viewController.delegate = sut
        
        viewController.delegate?.reloadCollectionView()
        
        XCTAssertTrue(sut.passedReloadCollectionView == true)
    }
}
