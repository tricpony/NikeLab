//
//  API.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//  Copyright © 2020 Gigabit LLC. All rights reserved.
//

import Foundation

/// URL factory.
struct API {
    private static let base = "https://rss.itunes.apple.com/api/v1/us"
    
    /// Compose feed URL.
    /// - Parameters:
    ///   - media: Media library.
    ///   - feed: Media category.
    ///   - genre: Media genre.
    ///   - resultCount: How many to fetch.
    /// - Returns: URL that looks like https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json
    static func feedURL(media: String = "apple-music", feed: String = "top-albums", genre: String = "all", resultCount: String = "5") -> URL? {
        URL(string: "\(base)/\(media)/\(feed)/\(genre)/\(resultCount)/explicit.json")
    }
}
