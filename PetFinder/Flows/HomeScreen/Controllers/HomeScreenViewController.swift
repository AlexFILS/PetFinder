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
    var viewModel: HomeScreenViewModelType!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        self.initialSetup()
        super.viewDidLoad()
    }
    
    private func initialSetup() {
        self.bindTableView()
        self.petsTableView.rx.setDelegate(self).disposed(by: bag)
        self.viewModel.initializeServices() { error in
            // TODO handle errors via alerts
            print(error?.description)
        }
    }
    
    private func bindTableView() {
        self.petsTableView.register(UINib(nibName: "PetCellXib", bundle: nil), forCellReuseIdentifier: "PetCell")
        
        self.viewModel.getListItems().bind(
            to: self.petsTableView.rx.items(
                cellIdentifier: "PetCell", cellType: PetCell.self
            )
        )
        {
            (row, item, cell) in
            // TODO: extract strings, improve image link fetch and move what's possible to viewmodel
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
            .subscribe(onNext: { [weak self] item in
                self?.viewModel.itemSelected(item)
                print("SelectedItem: \(item.breeds.primary)")
            })
            .disposed(by: bag)
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
