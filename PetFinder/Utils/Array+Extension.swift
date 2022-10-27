//
//  Array+Extension.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 27.10.2022.
//

extension Array {
    
    func elementAtPosition(_ position: Int) -> Element? {
        if self.count > position {
            return self[position]
        } else {
            return nil
        }
    }
}
