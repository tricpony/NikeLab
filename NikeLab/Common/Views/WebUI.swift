//
//  WebUI.swift
//  NikeLab
//
//  Created by aarthur on 5/17/21.
//

import Foundation
import SwiftUI
import WebKit

typealias WebLoadCompletion = (Bool) -> ()
struct WebUI: UIViewRepresentable {
    var url: URL
    var action: WebLoadCompletion
    var observer: WebLoadingObserver!
    
    init(url: URL, action: @escaping WebLoadCompletion) {
        self.url = url
        self.action = action
        self.observer = WebLoadingObserver(action: action)
    }
    
    // MARK: UIViewRepresentable
    
    func makeUIView(context: Context) -> WKWebView  {
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.navigationDelegate = observer
        webView.load(request)
        return webView
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        return
    }    
}

class WebLoadingObserver: NSObject, WKNavigationDelegate {
    var action: WebLoadCompletion!

    init(action: @escaping WebLoadCompletion) {
        self.action = action
    }
    
    // MARK: WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        action(true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        action(false)
    }
}
