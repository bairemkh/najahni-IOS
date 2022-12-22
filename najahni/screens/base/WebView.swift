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
        let wKWebView = WKWebView()
        wKWebView.navigationDelegate = context.coordinator
        return wKWebView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(parent: self)
    }
    
    class WebViewCoordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            //let urlToMatch = "https://preprod.konnect.network/gateway/payment-success"
            let urlStr = navigationAction.request.url?.absoluteString
            print(urlStr)
            if(navigationAction.request.url!.absoluteString.contains("admin")){
                CourseService.enrollNow(id: SessionManager.getCart()[0])
                UserDefaults.standard.removeObject(forKey: CART)
                UserDefaults.standard.set([String](),forKey: CART)
                var vm = CartViewModel()
                vm.list = [String]()
            parent.showWebView = false
            
            return decisionHandler(.cancel)
            
        }
                //parent.showWebView = false
            
            return decisionHandler(.allow)
        }
        
    }
}



