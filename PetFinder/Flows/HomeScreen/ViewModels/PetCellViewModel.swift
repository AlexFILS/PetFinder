//
//  PetCellViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import UIKit
import RxSwift

class PetCellViewModel {
    
    struct Services {
        let imageDownloadService: ImageDownloadServiceType
    }
    
    let petType: String
    let breed: String
    let gender: String
    let age: String
    let services: Services
    let avatarImage = PublishSubject<UIImage?>()
    
    init(fromAnimal animal: Animal, services: Services) {
        self.petType = animal.type
        self.breed = animal.breeds.primary
        self.gender = animal.gender
        self.age = animal.age
        self.services = services
    }
    
    func downloadAvatarImage() {
        self.services.imageDownloadService.downloadImage { [weak self] image in
            self?.avatarImage.onNext(image)
            self?.avatarImage.onCompleted()
        }
    }
}
