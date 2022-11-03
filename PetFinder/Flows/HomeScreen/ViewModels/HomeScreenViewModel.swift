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
    func getListItems() -> BehaviorSubject<[Animal]>
    func itemSelected(_ animal: Animal)
    func refreshList()
    func getItemCount() -> Int
}

class HomeScreenViewModel: HomeScreenViewModelType {
    
    public struct Services {
        let fetchListService: FetchListService<GetList<Animal>>
    }
    
    private let services: Services?
    weak var coordinator : MainCoordinatorType?
    private var animals = BehaviorSubject<[Animal]>(value: [])
    private var animalsPlain = [Animal]()
    private var currentPage = 1
    private var fetchedItemsCount = 0
    
    init(services: Services, coordinator: MainCoordinator) {
        self.services = services
        self.coordinator = coordinator
    }
    
    func getListItems() -> BehaviorSubject<[Animal]> {
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
    
    func getItemCount() -> Int {
        return self.fetchedItemsCount
    }
    private func getToken(completion: @escaping (CustomError?) -> Void) {
        AuthManager.shared.fetchAccessToken { error in
            completion(error)
        }
    }
    
    private func getAnimals(completion: @escaping (CustomError?) -> Void) {
        let parameters = [Parameters.page.rawValue : "\(self.currentPage)"]
        self.services?.fetchListService.getList(parameters: parameters) { [weak self] response, error in
            guard let self = self else {
                return
            }
            guard error == nil else {
                completion(error)
                return
            }
            if let animals = response?.animals {
                self.currentPage += 1
                self.fetchedItemsCount += animals.count
                self.animalsPlain.append(contentsOf: animals)
                self.animals.onNext(self.animalsPlain)
                completion(nil)
            }
        }
    }
    
    private func bearerExists() -> Bool {
        return AuthManager.shared.getStoredAccessToken() != nil
    }
}
