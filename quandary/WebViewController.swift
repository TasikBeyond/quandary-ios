//
//  WebViewController.swift
//  quandary
//
//  Created by Brandon Demeria on 2024-07-09.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, UIGestureRecognizerDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var stopEditing: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView.becomeFirstResponder()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        webView.endEditing(true)
    }

    func setupWebView() {
        let htmlString = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body {
                    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                    margin: 20px;
                }
            </style>
            <script>
                function dismissKeyboard() {
                    document.activeElement.blur();
                }
            </script>
        </head>
        <body contenteditable="true" id="editable">
            <p>Edit this text.</p>
        </body>
        </html>
        """

        webView.loadHTMLString(htmlString, baseURL: nil)
        webView.navigationDelegate = self
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "document.getElementById('editable').focus();"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    @IBAction func stopEditingButtonPressed(_ sender: Any) {
        let js = "dismissKeyboard();"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
