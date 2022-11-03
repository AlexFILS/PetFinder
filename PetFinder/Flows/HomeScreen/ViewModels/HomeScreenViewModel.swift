//
//  HomeScreenViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeScreenViewModelType {
    var coordinator: MainCoordinatorType? { get set }
    func initializeServices(completion: @escaping (CustomError?) -> Void)
    func getListItems() -> PublishSubject<[Animal]>
    func itemSelected(_ animal: Animal)
    func refreshList()
}

class HomeScreenViewModel: HomeScreenViewModelType {
    
    public struct Services {
        let fetchListService: FetchListService<GetList<Animal>>
    }
    
    private let services: Services?
    weak var coordinator : MainCoordinatorType?
    private var animals = PublishSubject<[Animal]>()
    
    init(services: Services, coordinator: MainCoordinator) {
        self.services = services
        self.coordinator = coordinator
    }
    
    func getListItems() -> RxSwift.PublishSubject<[Animal]> {
        return self.animals
    }
    
    
    func initializeServices(completion: @escaping (CustomError?) -> Void) {
        // TODO: non-soviet retry mechanism
        if bearerExists() {
            self.getAnimals() { error in
                completion(error)
            }
        } else {
            AuthManager.shared.fetchAccessToken { error in
                guard error == nil else {
                    completion(error)
                    return
                }
                self.getAnimals() { error in
                    completion(error)
                }
                completion(error)
            }
        }
    }
    
    func itemSelected(_ animal: Animal) {
        self.coordinator?.animalSelected(animal)
    }
    
    func refreshList() {
        self.getAnimals() { _ in }
    }
    
    private func getToken(completion: @escaping (CustomError?) -> Void) {
        AuthManager.shared.fetchAccessToken { error in
            completion(error)
        }
    }
    
    private func getAnimals(completion: @escaping (CustomError?) -> Void) {
        self.services?.fetchListService.getList { [weak self] response, error in
            guard error == nil else {
                completion(error)
                return
            }
            if let animals = response?.animals {
                self?.animals.onNext(animals)
                self?.animals.onCompleted()
                completion(nil)
            }
        }
    }
    
    private func bearerExists() -> Bool {
        return AuthManager.shared.getStoredAccessToken() != nil
    }
}
