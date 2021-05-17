//
//  AlbumRow.swift
//  NikeLab
//
//  Created by aarthur on 5/16/21.
//

import SwiftUI

struct AlbumRow: View {
    var album: Model

    var body: some View {
        HStack {
            LazyImage(imageUrlString: album.artworkUrl)

            VStack (alignment: .leading) {
                Text(album.name)
                    .foregroundColor(.primary)
                Spacer()
                Text(album.artistName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow(album: PreviewAlbum.mockAlbum)
    }
}