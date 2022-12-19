//
//  FilterView.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 17/12/22.
//

import UIKit

class FilterView: UIView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
        
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Rick"
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        return label
    }()
    
    lazy var aliveButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside)
        button.setTitle("Alive", for: .normal)
        button.backgroundColor = UIColor(named: "greenRick")
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var deadButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside)
        button.setTitle("Dead", for: .normal)
        button.backgroundColor = UIColor(named: "darkGreenRick")
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var unknownButton: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.addTarget(self, action: #selector(selectButton(sender:)), for: .touchUpInside)
        button.setTitle("Unknow", for: .normal)
        button.backgroundColor = UIColor(named: "darkGreenRick")
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Filtrar", for: .normal)
        button.backgroundColor = UIColor(named: "greenRick")
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var statusSelected: String = {
        let status = "alive"
        return status
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.addSubview(nameLabel)
        self.addSubview(textField)
        self.addSubview(statusLabel)
        self.addSubview(aliveButton)
        self.addSubview(deadButton)
        self.addSubview(unknownButton)
        self.addSubview(filterButton)
        self.backgroundColor = UIColor(named: "backgroundRick")
        self.createConstraints()
    }
    
    func createConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        
        aliveButton.translatesAutoresizingMaskIntoConstraints = false
        
        aliveButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8).isActive = true
        aliveButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        aliveButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        
        
        deadButton.translatesAutoresizingMaskIntoConstraints = false
        
        deadButton.topAnchor.constraint(equalTo: aliveButton.topAnchor).isActive = true
        deadButton.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor).isActive = true
        deadButton.widthAnchor.constraint(equalTo: aliveButton.widthAnchor).isActive = true
        
        unknownButton.translatesAutoresizingMaskIntoConstraints = false
        
        unknownButton.topAnchor.constraint(equalTo: aliveButton.topAnchor).isActive = true
        unknownButton.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor).isActive = true
        unknownButton.widthAnchor.constraint(equalTo: aliveButton.widthAnchor).isActive = true
        
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        filterButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32).isActive = true
        filterButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor).isActive = true
        filterButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func getValueTextField() -> String {
        guard let text = textField.text else { return "Rick"}
        return text
    }
    
    func getStatusSelected() -> String {
        return self.statusSelected
    }
    
    @objc
    func selectButton(sender: UIButton) {
        switch sender.tag {
        case 1:
            self.statusSelected = "alive"
            defineButtonsColors(senderTag: sender.tag)
            break
        case 2:
            self.statusSelected = "dead"
            defineButtonsColors(senderTag: sender.tag)
            break
        case 3:
            self.statusSelected = "unknow"
            defineButtonsColors(senderTag: sender.tag)
            break
        default:
            self.statusSelected = "alive"
            defineButtonsColors(senderTag: 1)
            break
        }
    }
    
    func defineButtonsColors(senderTag: Int) {
        let buttons = [aliveButton, deadButton, unknownButton]
        for button in buttons {
            if button.tag == senderTag {
                button.backgroundColor = UIColor(named: "greenRick")
            } else {
                button.backgroundColor = UIColor(named: "darkGreenRick")
            }
        }
    }
}
