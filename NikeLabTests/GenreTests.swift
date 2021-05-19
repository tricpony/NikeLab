//
//  GenreTests.swift
//  NikeLabTests
//
//  Created by aarthur on 5/18/21.
//

import XCTest
@testable import NikeLab

class GenreTests: XCTestCase {
    var album: Album?
    
    override func setUpWithError() throws {
        let mockPayload = albumJSON.data(using: .utf8)
        album = JsonUtility<Album>.parseJSON(mockPayload)
    }

    override func tearDownWithError() throws {
        album = .none
    }
    
    func testID() {
        guard let genres = album?.genres else {
            XCTFail()
            return
        }
        genres.forEach { XCTAssertEqual($0.id, "id") }
    }
    
    func testName() {
        guard let genres = album?.genres else {
            XCTFail()
            return
        }
        genres.forEach { XCTAssertEqual($0.name, "genre name") }
    }
}
