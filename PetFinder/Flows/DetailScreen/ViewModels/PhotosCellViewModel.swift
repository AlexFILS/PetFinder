//
//  PhotosCellViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol PhotosCellViewModelType {
    var numberOfItems: Int { get }
    func getPhotos() -> PublishSubject<[UIImage]>
    func itemSelected(_ image: UIImage)
}

class PhotosCellViewModel {
    
    public struct Services {
        let imagesDownloader: MultipleImageDownloadServiceType
    }
    
    var downloadedImages = PublishSubject<[UIImage]>()
    private let services: Services?
    
    init(services: Services) {
        self.services = services
    }

    func getPhotos() -> PublishSubject<[UIImage]> {
        return self.downloadedImages
    }
    
    func startDownload(completion: @escaping () -> ()) {
        self.services?.imagesDownloader.downloadImages { [weak self] photos in
            self?.downloadedImages.onNext(photos)
            self?.downloadedImages.onCompleted()
        }
    }
    
    func itemSelected(_ image: UIImage) {
        //self.coordinator?.animalSelected(animal)
        print("CSID deschid poze")
    }
}
