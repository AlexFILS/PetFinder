//
//  AddressCellView.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import UIKit

class AddressCellView: UITableViewCell {
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var address2Label: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var postcodeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    func configure(fromModel model: AddressCellModel) {
        self.address1Label.text = String(format: AddressCellTitles.address1LabelTitle.rawValue, model.address1)
        self.address2Label.text = String(format: AddressCellTitles.address2LabelTitle.rawValue, model.address2)
        self.cityLabel.text = String(format: AddressCellTitles.cityLabelTitle.rawValue, model.city)
        self.stateLabel.text = String(format: AddressCellTitles.stateLabelTitle.rawValue, model.state)
        self.postcodeLabel.text = String(format: AddressCellTitles.postcodeLabelTitle.rawValue, model.postcode)
        self.countryLabel.text = String(format: AddressCellTitles.countryLabelTitle.rawValue, model.country)
    }
    
}
