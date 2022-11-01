//
//  Breed.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct Breed: Decodable {
    let primary: String
    let secondary: String?
    let mixed: Bool
    let unknown: Bool
    
    enum CodingKeys: String, CodingKey {
        case primary
        case secondary
        case mixed
        case unknown
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primary = try container.decode(String.self, forKey: .primary)
        self.secondary = try container.decodeIfPresent(String.self, forKey: .secondary)
        self.mixed = try container.decode(Bool.self, forKey: .mixed)
        self.unknown = try container.decode(Bool.self, forKey: .unknown)
    }
}
