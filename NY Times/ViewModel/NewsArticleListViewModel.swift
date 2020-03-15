//
//  NewsArticleListViewModel.swift
//  NY Times
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation

struct  NewsArticleListViewModel {
    
    let webservice = Webservice()
    
    var allNews = [NewsArticleModel]()
    var filterdNews =  [NewsArticleModel]()
    var isDataFilterd = false
    private var period : Period = .weekly
    
}


extension NewsArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func getPeriod() -> Period {
        return period
    }
    
    mutating func setPeriod(_ period : Period) {
        self.period = period
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        
        if isDataFilterd{
            return filterdNews.count
        }
        return self.allNews.count
    }
    
    func articleAtIndex(_ index: Int) -> NewsArticleModel {
        
        let article = isDataFilterd ? filterdNews[index] : allNews [index]
        return article
    }
    
    
    
     func getResouce() -> Resource<NewsList>?{
        
        if let url = Webservice.getCompleteUrl(period){
             
            return Resource<NewsList>(url: url)
        }
        else{
            return nil
        }
        
    }
    
    mutating func newNewsList(_ newsList : NewsList){
       
        isDataFilterd = false
        allNews.removeAll()
        filterdNews.removeAll()
        
        allNews = newsList.results.map{
            
            NewsArticleModel($0)
        }
        
    }
    
    mutating func filterNews(_ keywordToSearch : String ){
        
        self.filterdNews = self.allNews.filter({ (news) -> Bool in
            
            
            return news.title.lowercased().contains(keywordToSearch.lowercased())
        })
        self.isDataFilterd = true
        
    }
    
    mutating func clearFilter(){
        
        filterdNews.removeAll()
        isDataFilterd = false
        
    }
    
    
    
    
    
}

extension NewsArticleListViewModel: AppViewModel {
   
    var screenTitle: String {
        return "News Articles"
    }

}





