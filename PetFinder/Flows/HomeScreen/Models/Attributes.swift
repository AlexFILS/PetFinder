//
//  Attributes.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct Attributes: Decodable {
    let spayedNeutered: Bool
    let houseTrained: Bool
    let decalwed: Bool
    let specialNeeds: Bool
    let shotsCurrent: Bool
    
    enum CodingKeys: String, CodingKey {
        case spayedNeutered = "spayed_neutered"
        case houseTrained = "house_trained"
        case decalwed
        case specialNeeds = "special_needs"
        case shotsCurrent = "shots_current"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.spayedNeutered = try container.decodeIfPresent(Bool.self, forKey: .spayedNeutered) ?? false
        self.houseTrained = try container.decodeIfPresent(Bool.self, forKey: .houseTrained) ?? false
        self.decalwed = try container.decodeIfPresent(Bool.self, forKey: .decalwed) ?? false
        self.specialNeeds = try container.decodeIfPresent(Bool.self, forKey: .specialNeeds) ?? false
        self.shotsCurrent = try container.decodeIfPresent(Bool.self, forKey: .shotsCurrent) ?? false
    }
}
