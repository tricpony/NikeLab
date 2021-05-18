//
//  Genre.swift
//  NikeLab
//
//  Created by aarthur on 5/16/21.
//

import Foundation

/// Genre model.
struct Genre: Model, Codable, Hashable, Identifiable {
    var id: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "genreId"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
