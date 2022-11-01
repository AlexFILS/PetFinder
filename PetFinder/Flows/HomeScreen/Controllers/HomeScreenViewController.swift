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

class HomeScreenViewController: BaseViewController, UITableViewDelegate {
    
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
            let model = PetCellViewModel(fromAnimal: item)
            cell.configure(withModel: model)
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
