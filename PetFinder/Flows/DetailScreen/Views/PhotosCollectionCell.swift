//
//  PhotosCollectionCell.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import UIKit

class PhotosCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(withImage image: UIImage) {
        self.imageView.image = image
    }
}
