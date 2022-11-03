//
//  MainTraitsCellView.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

import UIKit

class MainTraitsCellView: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var subbreedLabel: UILabel!
    @IBOutlet weak var mixedLabel: UILabel!
    @IBOutlet weak var unknownLabel: UILabel!
    
    func configure(fromModel model: MainTraitsCellModel) {
        self.nameLabel.text = String(format: MainTraitsLabelTitles.nameLabelText.rawValue, model.name)
        self.ageLabel.text = String(format: MainTraitsLabelTitles.ageLabelText.rawValue, model.age)
        self.speciesLabel.text = String(format: MainTraitsLabelTitles.speciesLabelText.rawValue, model.species)
        self.genderLabel.text = String(format: MainTraitsLabelTitles.genderLabelText.rawValue, model.gender)
        self.breedLabel.text = String(format: MainTraitsLabelTitles.breedLabelText.rawValue, model.breed)
        self.subbreedLabel.text = String(format: MainTraitsLabelTitles.subbreedLabelText.rawValue, model.subBreed)
        self.mixedLabel.text = String(format: MainTraitsLabelTitles.mixedLabelText.rawValue, model.mixed)
        self.unknownLabel.text = String(format: MainTraitsLabelTitles.unknownLabelText.rawValue, model.unknown)
    }
}
