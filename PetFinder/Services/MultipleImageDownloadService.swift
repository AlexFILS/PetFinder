//
//  MultipleImageDownloadService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import Foundation
import UIKit
import AlamofireImage

protocol MultipleImageDownloadServiceType: ImageDownloaderType, MultipleDownloadType {
    
}

protocol MultipleDownloadType {
    func downloadImages(completon: @escaping ([UIImage]) -> Void)
}

class MultipleImageDownloadService: MultipleImageDownloadServiceType {
    
    let paths: [String]
    private let dispatchGroup = DispatchGroup()
    
    lazy var imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 5,
        imageCache: AutoPurgingImageCache()
    )
    
    init(paths: [String]) {
        self.paths = paths
    }
    
    func downloadImages(completon: @escaping ([UIImage]) -> Void) {
        var images = [UIImage]()
        for path in  self.paths {
            self.dispatchGroup.enter()
            let urlRequest = URLRequest(url: URL(string: path)!)
            self.imageDownloader.download(urlRequest, completion:  { [weak self] response in
                if case .success(let image) = response.result {
                    images.append(image)
                    self?.dispatchGroup.leave()
                } else {
                    images.append(UIImage())
                    self?.dispatchGroup.leave()
                }
            })
        }
        self.dispatchGroup.notify(queue: .main) {
            completon(images)
        }
    }
}
