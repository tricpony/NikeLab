//
//  AlbumDetailContent.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import SwiftUI

struct AlbumDetailContent: View {
    let leadPadding: CGFloat = 20
    var album: Model
    lazy var artistURL: URL? = {
        URL(string: album.artistUrl)
    }()
    @State private var height: CGFloat = UIScreen.main.bounds.size.height / 2.0
    @State private var showingSheet: Bool = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            LazyImage(imageUrlString: album.artworkUrl)
                .ignoresSafeArea(edges: .top)
                .aspectRatio(contentMode: .fill)
                .frame(height: height)
            
            HStack {
                Button(action: { showingSheet.toggle() }) {
                    Text("iTunes")
                        .padding(.vertical)
                }
                .sheet(isPresented: $showingSheet){
                    WebContent(url: URL(string: album.artistUrl))
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 0.5))
                .padding([.top, .leading, .trailing], leadPadding)
                .padding(.bottom, 5)
            }

            Divider()

            GeometryReader { geometry in
                VStack (alignment: .leading) {
                    Text(album.name)
                        .foregroundColor(.primary)
                    Text(album.artistName)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(width: geometry.size.width, height: .none, alignment: .topLeading)
                .padding(.leading, leadPadding)
            }

        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(color: .white))
        
        Spacer()
    }
}

struct AlbumDetailContent_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailContent(album: PreviewAlbum.mockAlbum)
    }
}
