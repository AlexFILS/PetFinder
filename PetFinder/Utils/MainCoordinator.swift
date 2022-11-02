//
//  MainCoordinator.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit

protocol MainCoordinatorType: CoordinatorType {
    func animalSelected(_ animal: Animal)
}
class MainCoordinator: MainCoordinatorType {
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navController : UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        self.goToHomeScreen()
    }
    
    func popController() {
        navigationController.popViewController(animated: true)
    }
    
    private func goToHomeScreen() {
        let homeViewController = HomeScreenViewController.instantiate(flow: .home)
        let services = HomeScreenViewModel.Services(
            fetchListService: FetchListService<GetList<Animal>>(url: Endpoints.getAnimals.rawValue)
        )
        let homeScreenViewModel = HomeScreenViewModel(services: services, coordinator: self)
        homeViewController.viewModel = homeScreenViewModel
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func animalSelected(_ animal: Animal) {
        // not implemented
    }
}
