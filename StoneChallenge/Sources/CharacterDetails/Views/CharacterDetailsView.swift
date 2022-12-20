//
//  CharacterDetailsView.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 15/12/22.
//

import UIKit

class CharacterDetailsView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "STATUS"
        return label
    }()
    
    lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.text = "SPECIE"
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "TYPE"
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "GENDER"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = UIColor(named: "backgroundRick")
        self.addSubview(statusLabel)
        self.addSubview(imageView)
        self.addSubview(specieLabel)
        self.addSubview(typeLabel)
        self.addSubview(genderLabel)
        self.setupConstraints()
        imageView.backgroundColor = .yellow
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        
        specieLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        specieLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        specieLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
        
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        genderLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 16).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: specieLabel.leadingAnchor).isActive = true
        genderLabel.trailingAnchor.constraint(equalTo: specieLabel.trailingAnchor).isActive = true
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 16).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: specieLabel.leadingAnchor).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: specieLabel.trailingAnchor).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: specieLabel.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: specieLabel.trailingAnchor).isActive = true
    }
    
    
    func loadCharacterDetails(character: Character) {
        if let cachedImage = DataManager.shared.imageCash.object(forKey: NSNumber(value: character.id)) {
            imageView.image = cachedImage
        }

        typeLabel.text = "TYPE: \(character.type)"
        statusLabel.text = "STATUS: \(character.status)"
        genderLabel.text = "GENDER: \(character.gender)"
        specieLabel.text = "SPECIE: \(character.species)"
    }
}
