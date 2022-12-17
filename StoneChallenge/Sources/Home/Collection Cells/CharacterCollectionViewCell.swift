//
//  CharacterCollectionViewCell.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 12/12/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "characterCollectionCell"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.textColor = .white
        label.font = UIFont(name: "GetSchwifty-Regular", size: 20)
        return label
    }()
    
    lazy var statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var specieLabel: UILabel = {
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
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(statusImageView)
        self.contentView.addSubview(specieLabel)

        createConstraints()
    }
    
    func createConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        specieLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        specieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true

        specieLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        statusImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        statusImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        statusImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true

    }
    
    func setupImage(image: UIImage) {
        self.imageView.image = image
    }
    
    func setupCell(character: Character) {
        DataManager.shared.loadImage(character: character) { image in
            self.imageView.image = image
        }
        
        self.layer.cornerRadius = 15
        self.nameLabel.text = character.name
        self.statusImageView.image = UIImage(named: defineImageStatus(status: character.status))
        self.specieLabel.text = character.species
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
