//
//  WebContent.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import SwiftUI

/// Web view that displays indeterminate progress view during the load.
struct WebContent: View {
    var url: URL?
    @State private var loading = true

    var body: some View {
        ZStack {
            HStack {
                WebUI(url: url!, action: { _ in
                    loading.toggle()
                })
            }

            ProgressView("Loading...").opacity(loading ? 1 : 0)
        }
    }
}

struct WebContent_Previews: PreviewProvider {
    static var previews: some View {
        WebContent(url: URL(string: "https://www.yahoo.com"))
    }
}
