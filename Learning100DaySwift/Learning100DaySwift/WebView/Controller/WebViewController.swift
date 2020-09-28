//
//  WebViewController.swift
//  Learning100DaySwift
//
//  Created by Boss on 9/24/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Click vào đây", style: .plain, target: self, action: #selector(openTapped))
        webview.navigationDelegate = self
        webview.load(URLRequest(url: URL(string: "https://www.hackingwithswift.com/100/24")!))
        webview.allowsBackForwardNavigationGestures = true
    }
    
    
    
    @objc func openTapped() {
        let action = UIAlertController(title: "Open Page...", message: "Thông báo", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "google.com", style: .destructive, handler: openPage(action:)))
        action.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        action.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(action, animated: true, completion: nil)
    }
    
     func openPage(action: UIAlertAction) {
        let url = URL(string: "http://" + action.title!)!
        webview.load(URLRequest(url: url))
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}
