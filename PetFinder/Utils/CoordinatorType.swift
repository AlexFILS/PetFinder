//
//  CoordinatorType.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit
// This is our base coordinator layout
protocol CoordinatorType: AnyObject {
    // No child coordinator list and no removing child function because we don't need them for this app
    var navigationController : UINavigationController { get set }
    func start()
    func popController()
}
