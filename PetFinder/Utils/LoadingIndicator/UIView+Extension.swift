//
//  UIView+Extension.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import UIKit

extension UIView {
    func showBlurLoader() {
        let blurView = BlurView(frame: frame)
        self.addSubview(blurView)
    }

    func removeBlurLoader() {
        if let blurView = subviews.first(where: { $0 is BlurView }) {
            blurView.removeFromSuperview()
        }
    }
}
