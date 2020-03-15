//
//  ArticleDetailViewViewController.swift
//  NY Times
//
//  Created by Lohith on 15/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailWebViewController: UIViewController {
    
   @IBOutlet weak var webView: WKWebView!
    
    var articleView : NewsArticleModel!


    override func viewDidLoad() {
        super.viewDidLoad()
        initWebView()
    }
    

    
    private func initWebView(){
    
        if let url = articleView.articleUrl{
            webView.load(URLRequest(url: url))

        }
       webView.allowsBackForwardNavigationGestures = true
        
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
