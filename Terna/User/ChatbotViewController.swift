//
//  ChatbotViewController.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit

class ChatbotViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    let url = "https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=af876ecc-6438-4ae0-a97e-89777a7ce72f&serviceInstanceID=b1dfa529-0473-4c7f-95b8-db55961c4a0e"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initWebView()
    }
    

    private func initWebView() {
        webView.loadRequest(URLRequest(url: URL(string: url)!))
    }
}
