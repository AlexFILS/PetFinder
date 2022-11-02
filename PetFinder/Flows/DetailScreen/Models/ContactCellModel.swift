//
//  ContactModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

struct ContactCellModel {
    let email: String
    let phone: String
    
    init(from model: Contact) {
        self.email = model.email ?? CommonStrings.notSpecified.rawValue
        self.phone = model.phone ?? CommonStrings.notSpecified.rawValue
    }
}
