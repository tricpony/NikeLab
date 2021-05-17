//
//  AlbumMasterContent.swift
//  NikeLab
//
//  Created by aarthur on 5/16/21.
//

import SwiftUI

struct AlbumMasterContent: View {
    @State private var loading = true
    @State private var albums = [Album]()

    var body: some View {
        ZStack {
            NavigationView {
                List(albums) { album in
                    NavigationLink (destination: AlbumDetailContent(album: album)) {
                        AlbumRow(album: album)
                    }
                }.navigationTitle("Top 100 Albums")
            }

            ProgressView("Loading...").opacity(loading ? 1 : 0)
        }.onAppear(perform: {
            Loader<RootContainer>().load(API.feedURL) { result in
                DispatchQueue.main.async {
                    loading = false
                    switch result {
                    case .success(let rootContainer):
                        guard let results = rootContainer?.results else { return }
                        self.albums = results
                    case .failure(let error):
                        fatalError(error.errorDescription ?? "Error ocurred")
                    }
                }
            }
        })
    }
}

struct AlbumContent_Previews: PreviewProvider {
    static var previews: some View {
        AlbumMasterContent()
    }
}
