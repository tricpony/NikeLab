//
//  Albulm.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//

import Foundation

struct Album: Codable, Hashable, Identifiable {
    var id: String
    var artistName: String
//    var genre: String
    var name: String
    var copyright: String
    var releaseDate: String
    var artworkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case artistName
//        case genre
        case name
        case copyright
        case releaseDate
        case artworkUrl = "artworkUrl100"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.artistName = try container.decode(String.self, forKey: .artistName)
//        self.genre = try container.decode(String.self, forKey: .genre)
        self.name = try container.decode(String.self, forKey: .name)
        self.copyright = try container.decode(String.self, forKey: .copyright)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.artworkUrl = try container.decode(String.self, forKey: .artworkUrl)
    }
}
