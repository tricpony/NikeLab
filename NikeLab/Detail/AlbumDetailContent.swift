//
//  AlbumDetailContent.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import SwiftUI

struct AlbumDetailContent: View {
    var album: Model

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AlbumDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailContent(album: PreviewAlbum.mockAlbum)
    }
}
