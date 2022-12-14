//
//  PageInfo.swift
//  StoneChallenge
//
//  Created by Luca Hummel on 13/12/22.
//

import Foundation

struct PageInfo: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}
