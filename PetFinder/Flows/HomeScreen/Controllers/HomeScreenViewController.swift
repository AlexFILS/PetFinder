//
//  HomeScreenViewController.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

import Foundation
import UIKit
import Alamofire

class HomeScreenViewController: BaseViewController {
    
    @IBOutlet weak var petsTableView: UITableView!
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        self.petsTableView.delegate = self
        super.viewDidLoad()
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
