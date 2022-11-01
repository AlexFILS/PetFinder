//
//  PetModel.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import UIKit

class PetCell: UITableViewCell {
    @IBOutlet weak var cellAvatar: UIImageView!
    @IBOutlet weak var petTypeLabel: UILabel!
    @IBOutlet weak var petBreedLabel: UILabel!
    @IBOutlet weak var petAgeLabel: UILabel!
    @IBOutlet weak var petSexLabel: UILabel!
    
    func configure(withModel model: PetCellViewModel) {
        self.cellAvatar.image = UIImage(named: "plus")
        self.petTypeLabel.text = model.petType
        self.petBreedLabel.text = model.breed
        self.petAgeLabel.text = model.age
        self.petSexLabel.text = model.gender
    }
}
