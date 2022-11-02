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
    case getAnimal = "https://api.petfinder.com/v2/animals/"
}

enum CommonStrings: String {
    case notSpecified = "Not specified"
}

enum DetailScreenSectionTitles: String {
    case mainTraits = "Main Traits"
    case apperance = "Apperance"
    case address = "Address"
    case contact = "Contact"
}
