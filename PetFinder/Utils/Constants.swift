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
    case photoDownloadError = "https://image.shutterstock.com/image-vector/caution-exclamation-mark-white-red-600w-1055269061.jpg"
}

enum CommonStrings: String {
    case notSpecified = "Not specified"
}

enum DetailScreenSectionTitles: String {
    case mainTraits = "Main Traits"
    case apperance = "Apperance"
    case address = "Address"
    case contact = "Contact"
    case photos = "Photos"
}

enum MainTraitsLabelTitles: String {
    case nameLabelText = "Name: %@"
    case ageLabelText = "Age: %@"
    case speciesLabelText = "Species: %@"
    case genderLabelText = "Gender: %@"
    case breedLabelText = "Breed: %@"
    case subbreedLabelText = "Subbreed: %@"
    case mixedLabelText = "Mixed: %@"
    case unknownLabelText = "Unknown: %@"
}

enum MainTraitsCellTitles: String {
    case size = "Size: %@"
    case coat = "Coat: %@"
    case primaryColor = "Primary color: %@"
    case secondaryColor = "Secondary color: %@"
    case tertiaryColor = "Tertiary color: %@"
}
enum DetailScreenCellIdentifiers: String {
    case appearanceCell = "AppearanceCell"
    case mainTraitsCell = "MainTraitsCell"
    case photosCell = "PhotosCell"
    case contactCell = "ContactCell"
    case addressCell = "AddressCell"
    case photosCollectionCell = "PhotosCollectionCell"
}

enum HomeScreenCellIdentifier: String {
    case petCell = "PetCell"
}
enum AddressCellTitles: String {
    case address1LabelTitle = "Address: %@"
    case address2LabelTitle = "Address 2: %@"
    case cityLabelTitle = "City: %@"
    case stateLabelTitle = "State: %@"
    case postcodeLabelTitle = "Post code: %@"
    case countryLabelTitle = "Country: %@"
}

enum ContactCellTitles: String {
    case email = "E-mail: %@"
    case phone = "Phone: %@"
}

enum AlertConstants: String {
    case genericTitle = "Attention!"
    case buttonOk = "OK"
    case buttonRetry = "Retry"
}
