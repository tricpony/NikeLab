//
//  APITests.swift
//  NikeLabTests
//
//  Created by aarthur on 5/18/21.
//

import XCTest
@testable import NikeLab

class APITests: XCTestCase {

    func testDefaultRSSFeedServiceAddress() {
        guard let url = API.feedURL() else {
            XCTFail()
            return
        }
        XCTAssertEqual(url.absoluteString, "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json")
    }
    
    func testCustomRSSFeedServiceAddress() {
        let media = "media"
        let feed = "library"
        let genre = "genre"
        let limit = "200"
        guard let url = API.feedURL(media: media, feed: feed, genre: genre, resultCount: limit) else {
            XCTFail()
            return
        }
        XCTAssertEqual(url.absoluteString, "https://rss.itunes.apple.com/api/v1/us/\(media)/\(feed)/\(genre)/\(limit)/explicit.json")
    }
}
