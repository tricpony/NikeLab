//
//  Albulm.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//

import Foundation
import SwiftUI

/// Album model.
struct Album: Model, Codable, Hashable, Identifiable {
    var id: String
    var artistName: String
    var genres: [Genre]?
    var name: String
    var copyright: String
    var releaseDate: String
    var artworkUrl: String
    var artistUrl: String
        
    enum CodingKeys: String, CodingKey {
        case id
        case artistName
        case genres
        case name
        case copyright
        case releaseDate
        case artworkUrl = "artworkUrl100"
        case artistUrl
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.genres = try container.decode([Genre].self, forKey: .genres)
        self.name = try container.decode(String.self, forKey: .name)
        self.copyright = try container.decode(String.self, forKey: .copyright)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.artworkUrl = try container.decode(String.self, forKey: .artworkUrl)
        self.artistUrl = try container.decode(String.self, forKey: .artistUrl)
    }
    
    var displayGenre: String? {
        genres?.first?.name
    }
}

extension Album {
    static var mockAlbum: Album? {
        let albumJSON = "{\"id\"id,\"artistName\":\"artist name\",\"name\":\"name\",\"copyright\":\"copyright\", \"releaseDate\":\"releaseDate\", \"artworkUrl\":\"artworkUrl\"}"
        guard let data = albumJSON.data(using: .utf8) else { return .none }
        do {
            let album = try JSONDecoder().decode(Album.self, from: data)
            return album
        } catch let error as NSError {
            print(error)
        }
        return .none
    }
}
