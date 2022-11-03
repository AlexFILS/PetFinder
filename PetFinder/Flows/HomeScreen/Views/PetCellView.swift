//
//  PetModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import UIKit
import RxSwift
import RxCocoa

class PetCellView: UITableViewCell {
    @IBOutlet weak var cellAvatar: UIImageView!
    @IBOutlet weak var petTypeLabel: UILabel!
    @IBOutlet weak var petBreedLabel: UILabel!
    @IBOutlet weak var petAgeLabel: UILabel!
    @IBOutlet weak var petGenderLabel: UILabel!
    
    private var viewModel: PetCellViewModel?
    private let disposeBag = DisposeBag()
    
    func configure(with viewModel: PetCellViewModel) {
        self.showBlurLoader()
        self.viewModel = viewModel
        self.cellAvatar.image = UIImage(named: "plus")
        self.petTypeLabel.text = viewModel.petType
        self.petBreedLabel.text = viewModel.breed
        self.petAgeLabel.text = viewModel.age
        self.petGenderLabel.text = viewModel.gender
        self.bindViewModel()
        self.viewModel?.downloadAvatarImage()
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else {
            return
        }
        viewModel.avatarImage.subscribe(onNext: { [weak self] image in
            DispatchQueue.main.async { [weak self] in
                self?.cellAvatar.image = image
                self?.setNeedsLayout()
                self?.removeBlurLoader()
            }
        }).disposed(by: self.disposeBag)
    }
}
