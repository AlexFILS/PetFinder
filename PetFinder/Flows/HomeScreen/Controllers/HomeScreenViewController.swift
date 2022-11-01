//
//  HomeScreenViewController.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit

class HomeScreenViewController: BaseViewController {
    
    @IBOutlet weak var petsTableView: UITableView!
    var viewModel: HomeScreenViewModel!
    
    override func viewDidLoad() {
        self.initialSetup()
        super.viewDidLoad()
    }
    
    private func initialSetup() {
        self.petsTableView.delegate = self
        self.viewModel.getToken() { success in
            if success {
                self.viewModel.getAnimals()
            }
        }
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    
}

extension HomeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
