//
//  API.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//  Copyright © 2020 Gigabit LLC. All rights reserved.
//

import Foundation

enum RSSArg {
    case media(arg: String = "apple-music")
    case feed(arg: String = "top-albums")
    case genre(arg: String = "all")
    case resultCount(arg: String = "100")

    /// Provide RSS arg of case.
    var arg: String {
        switch self {
        case .media(let arg):
            return arg
        case .feed(let arg):
            return arg
        case .genre(let arg):
            return arg
        case .resultCount(let arg):
            return arg
        }
    }

}

/// URL factory.
struct API {
    private static let base = "https://rss.itunes.apple.com/api/v1/us"
    
    /// URL that looks like https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json
    static var feedURL: URL? {
        URL(string: "\(base)/\(RSSArg.media().arg)/\(RSSArg.feed().arg)/\(RSSArg.genre().arg)/\(RSSArg.resultCount().arg)/explicit.json")
    }
}
