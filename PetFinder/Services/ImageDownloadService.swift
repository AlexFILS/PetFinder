//
//  ImageDownloadService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation
import AlamofireImage

protocol ImageDownloaderType {
    var imageDownloader: ImageDownloader { get }
}

protocol SingleDownloadType {
    var path: String { get }
    func downloadImage(completion: @escaping (UIImage) -> Void)
}

protocol ImageDownloadServiceType: ImageDownloaderType, SingleDownloadType {
    
}

class ImageDownloadService: ImageDownloadServiceType {
    
    let path: String
    lazy var imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 1,
        imageCache: AutoPurgingImageCache()
    )
    
    init(path: String) {
        self.path = path
    }
    
    func downloadImage(completion: @escaping (UIImage) -> Void) {
        let urlRequest = URLRequest(url: URL(string: self.path)!)
        self.imageDownloader.download(urlRequest, completion:  { response in
            if case .success(let image) = response.result {
                completion(image)
            }
        })
    }
}
