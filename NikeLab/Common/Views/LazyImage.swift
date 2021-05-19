//
//  LazyImage.swift
//  NikeLab
//
//  Created by aarthur on 5/16/21.
//

import SwiftUI

/// Image that loads on demand presenting an indeterminate progress view during the load.
struct LazyImage: View {
    var imageUrlString: String!
    @State private var loading = true
    @State private var image: Image? = .none

    var body: some View {
        ZStack {
            image?.resizable()

            ProgressView().opacity(loading ? 1 : 0)
        }.onAppear(perform: performImageFetch)
    }
    
    /// Fetch and initialize image property.
    private func performImageFetch() {
        let url = URL(string: imageUrlString)
        Loader<Data>().loadData(url) { result in
            DispatchQueue.main.async {
                loading = false
                switch result {
                case .success(let data):
                    guard let data = data else {
                        image = Image("NoArt")
                        return
                    }
                    guard let uiImage = UIImage(data: data) else {
                        image = Image("NoArt")
                        return
                    }
                    image = Image(uiImage: uiImage)
                case .failure( _ ):
                    image = Image("NoArt")
                }
            }
        }
    }
}

struct LazyImage_Previews: PreviewProvider {
    static var previews: some View {
        LazyImage()
    }
}
