//
//  Contact.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct Contact: Decodable {
    let email: String?
    let phone: String?
    let address: Address
    
    enum CodingKeys: String, CodingKey {
        case email
        case phone
        case address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.address = try container.decode(Address.self, forKey: .address)
    }
}
