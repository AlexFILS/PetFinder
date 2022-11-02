//
//  AppearanceTraitsModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

struct AppearanceTraitsCellModel {
    let size: String
    let coat: String
    let primaryColor: String
    let secondaryColor: String
    let tertiaryColor: String
    
    init(from viewModel: Animal) {
        self.size = viewModel.size
        self.coat = viewModel.coat ?? CommonStrings.notSpecified.rawValue
        self.primaryColor = viewModel.colors.primary ?? CommonStrings.notSpecified.rawValue
        self.secondaryColor = viewModel.colors.secondary ?? CommonStrings.notSpecified.rawValue
        self.tertiaryColor = viewModel.colors.tertiary ?? CommonStrings.notSpecified.rawValue
    }
}
