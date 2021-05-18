//
//  PreviewAlbum.swift
//  NikeLab
//
//  Created by aarthur on 5/16/21.
//

import Foundation

struct PreviewAlbum: Model {
    var id: String
    var artistName: String
    var genres: [Genre]?
    var name: String
    var copyright: String
    var releaseDate: String
    var artworkUrl: String
    var artistUrl: String

    static var mockAlbum: PreviewAlbum {
        PreviewAlbum(id: "id",
                     artistName: "artist name",
                     genres: .none,
                     name: "name",
                     copyright: "copyright",
                     releaseDate: "release date",
                     artworkUrl: "art work",
                     artistUrl: "artist url")
    }
}
