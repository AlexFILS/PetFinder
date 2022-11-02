//
//  HomeScreenViewController.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeScreenViewController: BaseViewController {
    // TODO: Extract inlines, move relevant logic to vm
    @IBOutlet weak var petsTableView: UITableView!
    var viewModel: HomeScreenViewModel!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        self.initialSetup()
        super.viewDidLoad()
    }
    
    private func initialSetup() {
        self.bindTableView()
        self.petsTableView.rx.setDelegate(self).disposed(by: bag)
        self.viewModel.getToken() { success in
            if success {
                self.viewModel.getAnimals()
            }
        }
    }
    
    private func bindTableView() {
        self.petsTableView.register(UINib(nibName: "PetCellXib", bundle: nil), forCellReuseIdentifier: "PetCell")
        
        self.viewModel.animals.bind(
            to: self.petsTableView.rx.items(
                cellIdentifier: "PetCell", cellType: PetCell.self
            )
        )
        {
            (row, item, cell) in
            // TODO: extract strings and move what's possible to viewmodel
            let imagePathvalue = item.photos.first?["medium"] ?? "https://image.shutterstock.com/image-vector/caution-exclamation-mark-white-red-600w-1055269061.jpg"
            let viewModel = PetCellViewModel(
                fromAnimal: item,
                services: PetCellViewModel.Services(
                    imageDownloadService: ImageDownloadService(path: imagePathvalue)
                )
            )
            cell.configure(with: viewModel)
        }
        .disposed(by: bag)
        
        self.petsTableView.rx.modelSelected(Animal.self)
            .subscribe(onNext: { item in
                print("SelectedItem: \(item.name)")
            })
            .disposed(by: bag)
        viewModel.getAnimals()
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
