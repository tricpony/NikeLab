//
//  RootContainer.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//

import Foundation

/// Root model object container.
struct RootContainer: Codable {
    var results: [Album]
    
    enum RootKeys: String, CodingKey {
        case root = "feed"
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: RootKeys.self, forKey: .root)
        self.results = try dataContainer.decode([Album].self, forKey: .results)
    }
}
