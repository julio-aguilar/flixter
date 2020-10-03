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

    var idx:String?
    var movie : [String:Any]!

    var movies = [[String:Any]]()

    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let id = movie["id"] as! CVarArg
            let stringID = String(format: "%@", id)

            let url = URL(string: "https://api.themoviedb.org/3/movie/\(stringID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
             print(error.localizedDescription)
            } else if let data = data {
             let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
            self.movies = dataDictionary["results"] as! [[String:Any]]
                
                
            let result = self.movies[0]
            let key = result["key"] as! String
            print(key)
            print(result)
            let myURL = URL(string:"https://www.youtube.com/watch?v=\(key)")
            let myRequest = URLRequest(url: myURL!)
            self.webView.load(myRequest)
                  }
                }
        task.resume()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }

}
