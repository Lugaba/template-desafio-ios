//
//  Character.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 13/12/22.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case image
    }
}
