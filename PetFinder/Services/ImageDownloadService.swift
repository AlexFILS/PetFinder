//
//  ImageDownloadService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation
import AlamofireImage

class ImageDownloadService {
    
    let path: String
    private let imageDownloader = ImageDownloader(
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
