//
//  MainCoordinator.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorType {
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
        let homeScreenviewModel = HomeScreenViewModel()
        homeScreenviewModel.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
