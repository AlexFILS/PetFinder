//
//  Animal.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 01.11.2022.
//

import Foundation


struct Animal: Decodable {
    let id: Int
    let organizationId: String
    let url: String
    let type: String
    let species: String
    let breeds: Breed
    let colors: AnimalColor
    let age: String
    let gender: String
    let size: String
    let coat: String?
    let name: String
    let photos: [[String: String]]
    let videos: [[String: String]]
    let status: String
    let attributes: Attributes
    let environment: Environment
    let tags: [String]
    let contact: Contact
    let publishedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case organizationId = "organization_id"
        case url
        case type
        case species
        case breeds
        case colors
        case age
        case gender
        case size
        case coat
        case name
        case photos
        case videos
        case status
        case attributes
        case environment
        case tags
        case contact
        case publishedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.organizationId = try container.decode(String.self, forKey: .organizationId)
        self.url = try container.decode(String.self, forKey: .url)
        self.type = try container.decode(String.self, forKey: .type)
        self.species = try container.decode(String.self, forKey: .species)
        self.breeds = try container.decode(Breed.self, forKey: .breeds)
        self.colors = try container.decode(AnimalColor.self, forKey: .colors)
        self.age = try container.decode(String.self, forKey: .age)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.size = try container.decode(String.self, forKey: .size)
        self.coat = try container.decodeIfPresent(String.self, forKey: .coat)
        self.name = try container.decode(String.self, forKey: .name)
        self.photos = try container.decode([[String:String]].self, forKey: .photos)
        self.videos = try container.decode([[String: String]].self, forKey: .videos)
        self.status = try container.decode(String.self, forKey: .status)
        self.attributes = try container.decode(Attributes.self, forKey: .attributes)
        self.environment = try container.decode(Environment.self, forKey: .environment)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.contact = try container.decode(Contact.self, forKey: .contact)
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
    }
}
