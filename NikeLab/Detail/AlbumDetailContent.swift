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
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack {
            LazyImage(imageUrlString: album.artworkUrl)
                .ignoresSafeArea(edges: .top)
                .aspectRatio(contentMode: .fill)
                .frame(height: height)
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("iTunes")
                        .padding(.vertical)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 0.5))
                .padding([.top, .leading, .trailing], 20.0)
            }

            VStack (alignment: .leading) {
                Text(album.name)
                    .foregroundColor(.primary)
                Text(album.artistName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
            Image(systemName: "chevron.left")
              .foregroundColor(.white)
              .imageScale(.large) })
        
        Divider()
        Spacer()
    }
}

struct AlbumDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailContent(album: PreviewAlbum.mockAlbum)
    }
}
