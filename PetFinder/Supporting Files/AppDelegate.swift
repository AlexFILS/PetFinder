//
//  AppDelegate.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator : MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 3.0) // View my super splash screen
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController.init()
        appCoordinator = MainCoordinator(navController: navigationController)
        appCoordinator?.start()
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}
