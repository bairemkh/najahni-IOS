//
//  WebView.swift
//  najahni
//
//  Created by najahni on 10/12/2022.
//

import Foundation
import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
    var url: URL
    @Binding var showWebView: Bool
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }

}
class WebViewCoordinator: NSObject, WKNavigationDelegate {
       var parent: WebView
       
       init(_ parent: WebView) {
           self.parent = parent
       }
       
       func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
           let urlToMatch = "https://preprod.konnect.network/gateway/payment-success"
           if let urlStr = navigationAction.request.url?.absoluteString, urlStr == urlToMatch {
               parent.showWebView = false
           }
           decisionHandler(.allow)
       }
       
   }

