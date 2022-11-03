//
//  PhotosCellView.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import UIKit
import RxCocoa
import RxSwift

class PhotosCellView: UITableViewCell {
    @IBOutlet weak var photosCollection: UICollectionView!
    
    private var bag = DisposeBag()
    var viewModel: PhotosCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bind()
        self.showBlurLoader()
    }
    
    private func bind() {
        self.photosCollection.register(
            UINib(
                nibName: DetailScreenCellIdentifiers.photosCollectionCell.rawValue,
                bundle: nil
            ), forCellWithReuseIdentifier: DetailScreenCellIdentifiers.photosCollectionCell.rawValue
        )
        
        self.viewModel?.getPhotos().bind(
            to: self.photosCollection.rx.items
        )
        { collectionView, row, image in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  DetailScreenCellIdentifiers.photosCollectionCell.rawValue, for: indexPath) as! PhotosCollectionCell
            cell.configure(withImage: image)
            return cell
        }
        .disposed(by: self.bag)
    }
    
    func fetchImages() {
        self.viewModel.startDownload() { [weak self] in
            self?.removeBlurLoader()
        }
    }
}
