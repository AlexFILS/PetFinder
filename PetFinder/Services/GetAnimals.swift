//
//  GetAnimals.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation

struct GetList<T: Decodable>: Decodable {
    let animals: [T]
    let pagination: Pagination?
    
    struct Pagination: Decodable {
        let countPerPage: Int
        let totalCount: Int
        let currentPage: Int
        let totalPages: Int
        let links: Links?
        
        enum CodingKeys: String, CodingKey {
            case countPerPage = "count_per_page"
            case totalCount = "total_count"
            case currentPage = "current_page"
            case totalPages = "total_pages"
            case links
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.countPerPage = try container.decode(Int.self, forKey: .countPerPage)
            self.totalCount = try container.decode(Int.self, forKey: .totalCount)
            self.currentPage = try container.decode(Int.self, forKey: .currentPage)
            self.totalPages = try container.decode(Int.self, forKey: .totalPages)
            self.links = try container.decodeIfPresent(Links.self, forKey: .links)
        }
    }
}

struct Links: Decodable {
    let next: NextLink
    
    enum CodingKeys: String, CodingKey {
        case next
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.next = try container.decode(NextLink.self, forKey: .next)
    }
}

struct NextLink: Decodable {
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case href
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.href = try container.decode(String.self, forKey: .href)
    }
}
