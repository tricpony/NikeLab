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
        }.onAppear(perform: {
            let url = URL(string: imageUrlString)
            load(url) { result in
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
        })
    }
      
    /// Request service at urlString.
    /// - Parameters:
    ///   - url: Web address of art.
    ///   - completion: Call back to indicate success or failure associated with payload.
    func load(_ url: URL?, completion:@escaping (Swift.Result<Data?, ServiceError>)->()) {
        _ = ServiceManager.sharedService.startServiceAt(url: url) { result in
            switch result {
            case .success(let payload):
                completion(.success(payload))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct LazyImage_Previews: PreviewProvider {
    static var previews: some View {
        LazyImage()
    }
}
