//
//  AimalColor.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct AnimalColor: Decodable {
    let primary: String?
    let secondary: String?
    let tertiary: String?
    
    enum CodingKeys: String, CodingKey {
        case primary
        case secondary
        case tertiary
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primary = try container.decodeIfPresent(String.self, forKey: .primary)
        self.secondary = try container.decodeIfPresent(String.self, forKey: .secondary)
        self.tertiary = try container.decodeIfPresent(String.self, forKey: .tertiary)
    }
}
