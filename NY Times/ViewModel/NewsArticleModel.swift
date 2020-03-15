//
//  NewsArticleModel.swift
//  NY Times
//
//  Created by Lohith on 14/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation

struct NewsArticleModel {
    
    private let article: News
    
    init(_ article: News) {
        self.article = article
    }
}



extension NewsArticleModel {
    
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.abstract ?? ""
    }
    var authourName: String {
           return self.article.byLine ?? ""
    }
    var publishedDate: String {
           return self.article.published_date ?? ""
    }
    
    var articleUrl : URL? {
        
        guard let url = URL(string: self.article.url ?? "")else{
            return nil
        }
        return url
    }
}
