//
//  DetailScreenViewModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

import Foundation

protocol DetailScreenViewModelType {
    var coordinator: MainCoordinatorType { get }
    var animal: Animal { get }
    var sections: [Section] { get }
}

protocol TableViewSupportedViewModelType {
    var numberOfSections: Int { get }
    func modelForIndex(_ indexPath: IndexPath) -> CellType?
    func numberOfRows(inSection: Int) -> Int
}

public struct Section {
    let sectionTtitle: String
    let items: [CellType]
}

enum CellType {
    case mainTraitsCell(model: MainTraitsCellModel)
    case addressCell(model: AddressCellModel)
    case apperanceCell(model: AppearanceTraitsCellModel)
    case contactCell(model: ContactCellModel)
}

class DetailScreenViewModel: DetailScreenViewModelType, TableViewSupportedViewModelType {
    
    private(set) var animal: Animal
    private(set) var coordinator: MainCoordinatorType
    private(set) var sections = [Section]()
    
    init(animal: Animal, coordinator: MainCoordinatorType) {
        self.animal = animal
        self.coordinator = coordinator
        self.generateSections()
    }
    
    func modelForIndex(_ indexPath: IndexPath) -> CellType? {
        if let section = self.sections.elementAtPosition(indexPath.section),
           let model = section.items.elementAtPosition(indexPath.row) {
            return model
        } else {
            return nil
        }
    }
    
    func numberOfRows(inSection: Int) -> Int {
        return self.sections.elementAtPosition(inSection)?.items.count ?? 0
    }
    
    var numberOfSections: Int {
        return self.sections.count
    }
    
    private func generateSections() {
        var sections = [Section]()
        sections.append(self.generateMainTraitsSection())
        sections.append(self.generateApperanceSection())
        sections.append(self.generateAddressSection())
        sections.append(self.generateContactSection())
        self.sections = sections
    }
    
    private func generateMainTraitsSection() -> Section {
        var cells = [CellType]()
        let mainTraitsModel = MainTraitsCellModel(from: self.animal)
        cells.append(.mainTraitsCell(model: mainTraitsModel))
        return Section(sectionTtitle: DetailScreenSectionTitles.mainTraits.rawValue, items: cells)
    }
    
    private func generateApperanceSection() -> Section {
        var cells = [CellType]()
        let apperance = AppearanceTraitsCellModel(from: self.animal)
        cells.append(.apperanceCell(model: apperance))
        return Section(sectionTtitle: DetailScreenSectionTitles.apperance.rawValue, items: cells)
    }
    
    private func generateAddressSection() -> Section {
        var cells = [CellType]()
        let address = AddressCellModel(from: self.animal.contact.address)
        cells.append(.addressCell(model: address))
        return Section(sectionTtitle: DetailScreenSectionTitles.address.rawValue, items: cells)
    }
    
    private func generateContactSection() -> Section {
        var cells = [CellType]()
        let contact = ContactCellModel(from: self.animal.contact)
        cells.append(.contactCell(model: contact))
        return Section(sectionTtitle: DetailScreenSectionTitles.contact.rawValue, items: cells)
    }
}
