//
//  CharacterDetailsViewController.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 15/12/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    let detailView: CharacterDetailsView = CharacterDetailsView()
    var character: Character?
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor(named: "backgroundRick")
        view.addSubview(detailView)
        
        guard let character = character else { return }
        detailView.loadCharacterDetails(character: character)
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = character?.name
    }

}
