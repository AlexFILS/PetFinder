//
//  Environment.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct Environment: Decodable {
    let children: Bool
    let dogs: Bool
    let cats: Bool
    
    
    enum CodingKEys: String, CodingKey {
        case children
        case dogs
        case cats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKEys.self)
        self.children = try container.decodeIfPresent(Bool.self, forKey: .children) ?? false
        self.dogs = try container.decodeIfPresent(Bool.self, forKey: .dogs) ?? false
        self.cats = try container.decodeIfPresent(Bool.self, forKey: .cats) ?? false
    }
}
