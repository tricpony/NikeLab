//
//  WebUI.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebUI: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView  {
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        return webView
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        return
    }    
}
