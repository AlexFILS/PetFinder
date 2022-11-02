//
//  AddressModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

struct AddressCellModel {
    let address1: String?
    let city: String
    let state: String
    let postcode: String
    let country: String
    
    init(from viewModel: Address) {
        self.address1 = viewModel.address1 ?? CommonStrings.notSpecified.rawValue
        self.city = viewModel.city
        self.state = viewModel.state
        self.postcode = viewModel.postcode
        self.country = viewModel.country
    }
}
