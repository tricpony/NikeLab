//
//  AlbumDetailContent.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import SwiftUI

struct AlbumDetailContent: View {
    var album: Model
    @State private var height = UIScreen.main.bounds.size.height / 2
    
    var body: some View {
        VStack {
            LazyImage(imageUrlString: album.artworkUrl)

        }
    }
}

struct AlbumDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailContent(album: PreviewAlbum.mockAlbum)
    }
}
