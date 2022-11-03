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
        self.view.showBlurLoader()
        self.bindTableView()
        self.petsTableView.rx.setDelegate(self).disposed(by: bag)
        self.viewModel.initializeServices() { [unowned self] error in
            self.view.removeBlurLoader()
            if let error = error {
                self.showAlert(forError: error)
            }
        }
    }
    
    private func bindTableView() {
        self.petsTableView.register(
            UINib(
                nibName: HomeScreenCellIdentifier.petCell.rawValue,
                bundle: nil
            ), forCellReuseIdentifier: HomeScreenCellIdentifier.petCell.rawValue
        )
        
        self.viewModel.getListItems().bind(
            to: self.petsTableView.rx.items(
                cellIdentifier: HomeScreenCellIdentifier.petCell.rawValue, cellType: PetCellView.self
            )
        )
        {
            (row, item, cell) in
            // TODO: extract strings, improve image link fetch and move what's possible to viewmodel
            let imagePathvalue = item.photos.first?["medium"] ?? Endpoints.photoDownloadError.rawValue
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
            .subscribe(
                onNext: { [weak self] item in
                    self?.viewModel.itemSelected(item)
                }
            )
            .disposed(by: bag)
    }
    
    private func showAlert(forError error: CustomError) {
        if error == .denied {
            self.showAlertWithRefresh(forError: error)
        } else {
            let message = error.description
            AlertBuilder(viewController: self)
                .withTitle(AlertConstants.genericTitle.rawValue)
                .andMessage(message)
                .preferredStyle(.alert)
                .onSuccessAction(title: AlertConstants.buttonOk.rawValue, { _ in })
                .show()
        }
    }
    
    private func showAlertWithRefresh(forError error: CustomError) {
        let message = error.description
        let refreshAction: (UIAlertAction) -> Void = { _ in
            AuthManager.shared.fetchAccessToken { [weak self] error in
                self?.viewModel.refreshList()
            }
        }
        AlertBuilder(viewController: self)
            .withTitle(AlertConstants.genericTitle.rawValue)
            .andMessage(message)
            .preferredStyle(.alert)
            .onSuccessAction(title: AlertConstants.buttonOk.rawValue, { _ in })
            .onCustomAction(title: AlertConstants.buttonRetry.rawValue, refreshAction)
            .show()
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
