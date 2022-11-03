//
//  AppearanceCellView.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import UIKit

class AppearanceCellView: UITableViewCell {
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var coatLabel: UILabel!
    @IBOutlet weak var primaryColorLabel: UILabel!
    @IBOutlet weak var secondaryColorLabel: UILabel!
    @IBOutlet weak var tertiaryColorLabel: UILabel!
    
    func configure(fromModel model: AppearanceTraitsCellModel) {
        self.sizeLabel.text = String(format: MainTraitsCellTitles.size.rawValue, model.size)
        self.coatLabel.text = String(format: MainTraitsCellTitles.coat.rawValue, model.coat)
        self.primaryColorLabel.text = String(format: MainTraitsCellTitles.primaryColor.rawValue, model.primaryColor)
        self.secondaryColorLabel.text = String(format: MainTraitsCellTitles.secondaryColor.rawValue, model.secondaryColor)
        self.tertiaryColorLabel.text = String(format: MainTraitsCellTitles.tertiaryColor.rawValue, model.tertiaryColor)
    }
}
