//
//  BaseViewController.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, Storyboarded {
    
    func showLoadingIndicator() {
        self.view.showBlurLoader()
    }
    
    func hideLoadingIndicator() {
        self.view.removeBlurLoader()
    }
}
