//
//  Model.swift
//  NikeLab
//
//  Created by aarthur on 5/16/21.
//

import Foundation
import SwiftUI

protocol Model {
    var id: String { get }
    var artistName: String { get }
    var genres: [Model]? { get }
    var name: String { get }
    var copyright: String { get }
    var releaseDate: String { get }
    var artworkUrl: String { get }
    var artistUrl: String { get }
    var displayGenre: String? { get }
}

extension Model {
    var artistName: String {
        ""
    }
    
    var genres: [Model]? {
        .none
    }

    var copyright: String {
        ""
    }
    
    var releaseDate: String {
        ""
    }
    
    var artworkUrl: String {
        ""
    }
    
    var artistUrl: String {
        ""
    }
    
    var displayGenre: String? {
        ""
    }
}
