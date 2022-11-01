//
//  PetCellViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation

class PetCellViewModel {
    let petType: String
    let breed: String
    let gender: String
    let age: String
    let photoUrl: String?
    
    init(fromAnimal animal: Animal) {
        self.petType = animal.type
        self.breed = animal.breeds.primary
        self.gender = animal.gender
        self.age = animal.age
        self.photoUrl = animal.photos.first?["medium"]
    }
}
