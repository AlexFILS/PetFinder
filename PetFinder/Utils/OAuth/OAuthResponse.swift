//
//  OAuthResponse.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 28.10.2022.
//

import Foundation

struct OAuthResponse: Decodable {
     let token_type: String
     let expires_in: Int
     let access_token: String

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token_type = try container.decode(String.self, forKey: .tokenType)
        self.expires_in = try container.decode(Int.self, forKey: .expiresIn)
        self.access_token = try container.decode(String.self, forKey: .accessToken)
    }
}
