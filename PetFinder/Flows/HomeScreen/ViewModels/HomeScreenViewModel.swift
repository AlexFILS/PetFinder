//
//  HomeScreenViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation

class HomeScreenViewModel {
    
    public struct Services {
        let fetchListService: FetchListService<GetList<Animal>>
    }
    
    let services: Services?
    weak var coordinator : MainCoordinator?
    
    init(services: Services, coordinator: MainCoordinator) {
        self.services = services
        self.coordinator = coordinator
    }
    
    func getToken(completion: @escaping (Bool) -> Void) {
        AuthManager.shared.fetchAccessToken { error in
            if error == nil {
              completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func getAnimals() {
        self.services?.fetchListService.getList { response, error in
            print(response)
            print(error)
        }
    }
}
