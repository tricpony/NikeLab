//
//  AlbumTests.swift
//  NikeLabTests
//
//  Created by aarthur on 5/18/21.
//

import XCTest
@testable import NikeLab

class AlbumTests: XCTestCase {
    var album: Model?
    
    override func setUpWithError() throws {
        let mockPayload = albumJSON.data(using: .utf8)
        album = JsonUtility<Album>.parseJSON(mockPayload)
    }

    override func tearDownWithError() throws {
        album = .none
    }
    
    func testID() {
        XCTAssertEqual(album?.id, "id")
    }
    
    func testName() {
        XCTAssertEqual(album?.name, "name")
    }
    
    func testArtistName() {
        XCTAssertEqual(album?.artistName, "artistName")
    }
    
    func testCopyright() {
        XCTAssertEqual(album?.copyright, "copyright")
    }
    
    func testReleaseDate() {
        XCTAssertEqual(album?.releaseDate, "releaseDate")
    }
    
    func testArtworkUrl() {
        XCTAssertEqual(album?.artworkUrl, "artworkUrl")
    }
    
    func testDisplayGenre() {
        XCTAssertEqual(album?.displayGenre, "genre name")
    }
}
