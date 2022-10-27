//
//  UIStoryboard+Extension.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case home = "HomeScreen"
        case detail = "DetailFlow"
        
        var flowName: String {
            return rawValue
        }
    }
}
