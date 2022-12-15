//
//  CharacterCollectionViewCell.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 12/12/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "characterCollectionCell"
    
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var characterName: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.textColor = .white
        label.font = UIFont(name: "GetSchwifty-Regular", size: 20)
        return label
    }()
    
    lazy var characterStatus: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var characterSpecie: UILabel = {
        let label = UILabel()
        label.text = "SPECIE"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.contentView.addSubview(characterImageView)
        self.contentView.addSubview(characterName)
        self.contentView.addSubview(characterStatus)
        self.contentView.addSubview(characterSpecie)

        createConstraints()
    }
    
    func createConstraints() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        characterImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8).isActive = true
        characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
        characterSpecie.translatesAutoresizingMaskIntoConstraints = false
        characterSpecie.leadingAnchor.constraint(equalTo: characterName.leadingAnchor).isActive = true
        characterSpecie.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8).isActive = true

        characterSpecie.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        characterStatus.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        characterStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        characterStatus.heightAnchor.constraint(equalToConstant: 32).isActive = true
        characterStatus.widthAnchor.constraint(equalToConstant: 32).isActive = true

    }
    
    func setupImage(image: UIImage) {
        self.characterImageView.image = image
    }
    
    func setupCell(character: Character) {
        if let cachedImage = DataManager.shared.imageCash.object(forKey: NSNumber(value: character.id)) {
            self.setupImage(image: cachedImage)
        }
        
        self.layer.cornerRadius = 15
        self.characterName.text = character.name
        self.characterStatus.image = UIImage(named: defineImageStatus(status: character.status))
        self.characterSpecie.text = character.species
        self.backgroundColor = UIColor(named: "greenRick")
    }
    
    func defineImageStatus(status: String) -> String {
        if status == "Alive" {
            return "aliveIcon"
        } else if status == "Dead" {
            return "deadIcon"
        } else {
            return "unknownIcon"
        }
    }
}
