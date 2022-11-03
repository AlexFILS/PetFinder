//
//  ContactCellView.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import UIKit

class ContactCellView: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    func configure(fromModel model: ContactCellModel) {
        self.emailLabel.text = String(format: ContactCellTitles.email.rawValue, model.email)
        self.phoneLabel.text = String(format: ContactCellTitles.phone.rawValue, model.phone)
    }
}
