//
//  MultipleImageDownloadService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import Foundation
import UIKit
import AlamofireImage

protocol MultipleImageDownloadServiceType: ImageDownloadServiceType, MultipleDownloadType {
    
}

protocol MultipleDownloadType {
    func downloadImages() -> [UIImage]
}

class MultipleImageDownloadService: MultipleImageDownloadServiceType {
    
    let paths: [String]
    
    lazy var imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 1,
        imageCache: AutoPurgingImageCache()
    )
    
    init(paths: [String]) {
        self.paths = paths
    }
    
    func downloadImages() -> [UIImage] {
        var images = [UIImage]()
        self.paths.forEach { path in
            let urlRequest = URLRequest(url: URL(string: path)!)
            self.imageDownloader.download(urlRequest, completion:  { response in
                if case .success(let image) = response.result {
                    images.append(image)
                }
            })
        }
        return images
    }
}
