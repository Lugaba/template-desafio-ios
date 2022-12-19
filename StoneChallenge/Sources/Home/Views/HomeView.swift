//
//  HomeView.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 12/12/22.
//

import UIKit

class HomeView: UIView {

    lazy var characterCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(named: "backgroundRick")
        return collectionView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to reset filter")
        return refreshControl
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.addSubview(characterCollection)
        characterCollection.addSubview(refreshControl)
        self.backgroundColor = UIColor(named: "backgroundRick")
        self.createConstraints()
    }
    
    func createConstraints() {
        characterCollection.translatesAutoresizingMaskIntoConstraints = false
        characterCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        characterCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        characterCollection.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        characterCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func bindCollection(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        characterCollection.dataSource = dataSource
        characterCollection.delegate = delegate
    }
    
    func reloadCollectionView() {
        self.characterCollection.reloadData()
    }

}
