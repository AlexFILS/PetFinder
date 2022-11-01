//
//  OauthParameters.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 28.10.2022.
//

import Foundation

class OAuthParameters {
    let grant_type: String
    let client_id: String
    let client_secret: String
    
    static let shared = OAuthParameters(
        grant_type: "client_credentials",
        client_id: OAuthData.apiKey.rawValue,
        client_secret: OAuthData.secret.rawValue)
    
    private init(grant_type: String, client_id: String, client_secret: String) {
        self.grant_type = grant_type
        self.client_id = client_id
        self.client_secret = client_secret
    }
    
    public func getOAuthParameters() -> [String : String] {
        return [
            "grant_type": self.grant_type,
            "client_id": self.client_id,
            "client_secret": self.client_secret
        ]
    }
}
