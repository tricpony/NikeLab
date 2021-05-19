//
//  JsonUtilityTests.swift
//  NikeLabUITests
//
//  Created by aarthur on 5/18/21.
//

import XCTest
@testable import NikeLab

class JsonUtilityTests: XCTestCase {

    func testParsingJsonArray() {
        let mockPayload = albumsJSON.data(using: .utf8)
        let modelObjects = JsonUtility<[Album]>.parseJSON(mockPayload)
        XCTAssertNotNil(modelObjects)
        XCTAssertTrue(type(of: modelObjects) == [Album]?.self)
    }
    
    func testParsingJsonSingle() {
        let mockPayload = albumJSON.data(using: .utf8)
        let modelObjects = JsonUtility<Album>.parseJSON(mockPayload)
        XCTAssertNotNil(modelObjects)
        XCTAssertTrue(type(of: modelObjects) == Album?.self)
    }
}
