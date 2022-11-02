//
//  MainTraitsModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

struct MainTraitsCellModel {
    let name: String
    let age: String
    let breed: String
    let species: String
    let gender: String
    
    init(from viewModel: Animal) {
        self.name = viewModel.name
        self.age = viewModel.age
        self.breed = viewModel.breeds.primary
        self.species = viewModel.species
        self.gender = viewModel.gender
    }
}
