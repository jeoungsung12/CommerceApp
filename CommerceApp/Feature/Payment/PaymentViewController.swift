//
//  PaymentViewController.swift
//  CommerceApp
//
//  Created by 정성윤 on 12/3/24.
//

import UIKit
import Combine
import WebKit

final class PaymentViewController: UIViewController {
    private var webView: WKWebView?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        setUserAgent()
        setCookie()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
    }

    private func loadWebView() {
        guard let htmlPath = Bundle.main.path(forResource: "test", ofType: "html") else { return }
        let url = URL(fileURLWithPath: htmlPath)
        let request = URLRequest(url: url)
        
        webView?.load(request)
    }
    
    private func setUserAgent() {
        webView?.customUserAgent = "Cproject/1.0.0/iOS"
    }
    
    private func setCookie() {
        guard let cookie = HTTPCookie(properties: [
            .domain: "google.co.kr",
            .path: "/",
            .name: "myCookie",
            .value: "value",
            .secure: "FALSE",
            .expires: NSDate(timeIntervalSinceNow: 3600)
        ]) else { return }
        webView?.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
    }
}

#Preview {
    PaymentViewController()
}
