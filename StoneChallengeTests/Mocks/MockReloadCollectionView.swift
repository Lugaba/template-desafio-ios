//
//  MockReloadCollectionView.swift
//  StoneChallengeTests
//
//  Created by Luca Hummel on 20/12/22.
//

import Foundation
@testable import StoneChallenge

class MockReloadCollectionView: ReloadCollectionView {
    
    var passedReloadCollectionView: Bool = false
    
    func reloadCollectionView() {
        self.passedReloadCollectionView = true
    }
    
    
}
