//
//  ContentView.swift
//  NikeLab
//
//  Created by aarthur on 5/15/21.
//

import SwiftUI

struct ContentView: View {
    @State private var loading = true
    @State private var results = [Album]()

    var body: some View {
        ZStack {
            ProgressView("Loading...").opacity(loading ? 1 : 0).onAppear(perform: {
                Loader<RootContainer>().load { result in
                    DispatchQueue.main.async {
                        loading = false
                        switch result {
                        case .success(let rootContainer):
                            guard let results = rootContainer?.results else { return }
                            self.results = results
                        case .failure(let error):
                            fatalError(error.errorDescription ?? "Error ocurred")
                        }
                    }
                }
            })
            
            List(results) { album in
                Text(album.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
