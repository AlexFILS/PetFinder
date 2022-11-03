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
        self.detailsTableView.delegate = self
        self.registerCells()
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.viewModel.coordinator.popController()
    }
    
    private func registerCells() {
        self.detailsTableView.register(
            UINib(
                nibName: DetailScreenCellIdentifiers.mainTraitsCell.rawValue, bundle: nil),
            forCellReuseIdentifier: DetailScreenCellIdentifiers.mainTraitsCell.rawValue
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
        self.detailsTableView.register(
            UINib(
                nibName: DetailScreenCellIdentifiers.photosCell.rawValue, bundle: nil),
            forCellReuseIdentifier: DetailScreenCellIdentifiers.photosCell.rawValue
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
        case .mainTraitsCell(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.mainTraitsCell.rawValue) as? MainTraitsCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: viewModel)
            return cell
        case .apperanceCell(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.appearanceCell.rawValue) as? AppearanceCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: viewModel)
            return cell
        case .addressCell(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.addressCell.rawValue) as? AddressCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: viewModel)
            return cell
        case .contactCell(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.contactCell.rawValue) as? ContactCellView else {
                return UITableViewCell()
            }
            cell.configure(fromModel: viewModel)
            return cell
        case .photosCell(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenCellIdentifiers.photosCell.rawValue) as? PhotosCellView else {
                return UITableViewCell()
            }
            cell.viewModel = viewModel
            cell.fetchImages()
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

extension DetailScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.viewModel.modelForIndex(indexPath) {
        case .photosCell:
            return 90
        default:
            return UITableView.automaticDimension
        }
    }
}
