//
//  HomeScreenViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

class HomeScreenViewModel {
    
    public struct Services {
        let fetchListService: FetchListService<GetList<Animal>>
    }
    
    let services: Services?
    weak var coordinator : MainCoordinator?
    var animals = PublishSubject<[Animal]>()
    
    init(services: Services, coordinator: MainCoordinator) {
        self.services = services
        self.coordinator = coordinator
    }
    
    func getToken(completion: @escaping (Bool) -> Void) {
        AuthManager.shared.fetchAccessToken { error in
            // TODO: Adapt
            if error == nil {
              completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func getAnimals() {
        self.services?.fetchListService.getList { [weak self] response, error in
            if let animals = response?.animals {
                self?.animals.onNext(animals)
                self?.animals.onCompleted()
            }
        }
    }
}
