//
//  Address.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct Address: Decodable {
    let address1: String?
    let address2: String?
    let city: String
    let state: String
    let postcode: String
    let country: String
    
    enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case city
        case state
        case postcode
        case country
    }
    
    init(from decoder: Decoder) throws {
        let container = try  decoder.container(keyedBy: CodingKeys.self)
        self.address1 = try container.decodeIfPresent(String.self, forKey: .address1)
        self.address2 = try container.decodeIfPresent(String.self, forKey: .address2)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.postcode = try container.decode(String.self, forKey: .postcode)
        self.country = try container.decode(String.self, forKey: .country)
    }
}
