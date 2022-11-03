//
//  BaseResponse.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 03.11.2022.
//

import Foundation

struct BaseResponse: Decodable {
    let type: String
    let status: Int
    let title: String
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case title
        case status
        case detail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = try container.decode(Int.self, forKey: .status)
        self.detail = try container.decode(String.self, forKey: .detail)
        self.title = try container.decode(String.self, forKey: .title)
    }
    
}
