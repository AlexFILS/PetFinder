//
//  Constants.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation

enum KeychainData: String {
    case accessToken = "access-token"
    case oauthAccount = "oauth-account"
}

enum Endpoints: String {
    case getAnimals = "https://api.petfinder.com/v2/animals"
}
