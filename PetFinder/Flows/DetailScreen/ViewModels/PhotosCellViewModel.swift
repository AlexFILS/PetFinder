//
//  PhotosCellViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import Foundation
import UIKit

protocol PhotosCellViewModelType {
    
}

class PhotosCellViewModel {
    
    struct Service {
        let imagesDownloader: MultipleImageDownloadServiceType
    }
    
    private let photoUrls: [String]
    private var downloadedImages: [UIImage]
    
    init(photoUrls: [String]) {
        self.photoUrls = photoUrls
        self.downloadedImages = []
    }
}
