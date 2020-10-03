//
//  VideoViewController.swift
//  flixter
//
//  Created by Julio Leonardo Aguilar Colon on 10/2/20.
//  Copyright © 2020 julio.aguilar@live.com. All rights reserved.
//

import UIKit
import WebKit
class VideoViewController: UIViewController,WKUIDelegate {
    var webView: WKWebView!
//    var image: UIImage!

    var id:String!

//    var movies = [[String:Any]]()

    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        print(id)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
