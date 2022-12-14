//
//  ApiResponse.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 13/12/22.
//

import Foundation

struct ApiResponse: Codable {
    var info: PageInfo
    var results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
