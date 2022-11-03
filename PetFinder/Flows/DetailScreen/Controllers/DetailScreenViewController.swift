//
//  DetailScreenViewController.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

import Foundation
import UIKit

class DetailScreenViewController: BaseViewController {
    typealias DetailViewModelType = DetailScreenViewModelType & TableViewSupportedViewModelType
    var viewModel: DetailViewModelType!
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewDidLoad() {
        self.detailsTableView.dataSource = self
        self.registerCells()
        super.viewDidLoad()
    }
    
    private func registerCells() {
        self.detailsTableView.register(
            UINib(
                nibName: "MainTraitsCell", bundle: nil),
            forCellReuseIdentifier: "MainTraitsCell"
        )
        self.detailsTableView.register(
            UINib(
                nibName: DetailScreenCellIdentifiers.appearanceCell.rawValue, bundle: nil),
            forCellReuseIdentifier: DetailScreenCellIdentifiers.appearanceCell.rawValue
        )
        self.detailsTableView.register(
            UINib(
                nibName: DetailScreenCellIdentifiers.addressCell.rawValue, bundle: nil),
            forCellReuseIdentifier: DetailScreenCellIdentifiers.addressCell.rawValue
        )
        self.detailsTableView.register(
            UINib(
                nibName: DetailScreenCellIdentifiers.contactCell.rawValue, bundle: nil),
            forCellReuseIdentifier: DetailScreenCellIdentifiers.contactCell.rawValue
        )
    }
}

extension DetailScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = self.viewModel.modelForIndex(indexPath) else {
            return UITableViewCell()
        }
        switch item {
        case .mainTraitsCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTraitsCell") as? MainTraitsCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: model)
            return cell
        case .apperanceCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.appearanceCell.rawValue) as? AppearanceCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: model)
            return cell
        case .addressCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.addressCell.rawValue) as? AddressCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: model)
            return cell
        case .contactCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.contactCell.rawValue) as? ContactCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = self.viewModel.sections.elementAtPosition(section) {
            return section.sectionTtitle
        } else {
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections
    }
}
