//
//  NewsArticleModelTests.swift
//  NY TimesTests
//
//  Created by Lohith on 14/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import XCTest
@testable import NY_Times

class NewsArticleModelTests: XCTestCase {
    
     
    var newsArticleListModel = NewsArticleListViewModel()

    override func setUp() {
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testScreenTitle(){
        
        XCTAssertEqual(newsArticleListModel.screenTitle, "News Articles","Title is not valid")

    }
    
    func testNumberOfSection(){
        
        XCTAssertEqual(newsArticleListModel.numberOfSections, 1,"Number of section is not matching")

    }
    
    func testNumberOfrawsInSection(){
        
        XCTAssertEqual(newsArticleListModel.numberOfRowsInSection(newsArticleListModel.numberOfSections), 0,"numberOfRowsInSection is initialy 0")

    }
    
    
    func testIsDataFilterdValue(){
        
        XCTAssertEqual(newsArticleListModel.isDataFilterd, false,"Initialy isDataFilterd value going wrong")

    }
    
    func testGetResoucesShouldnotBeNil(){
        
       XCTAssertNotNil(newsArticleListModel.getResouce() , "Resouce value should not be nil")

    }
    
    
    func testAfterInsertingPuttingValue(){
        
        let articles = [News(id: 1, published_date: "14-03-2020", source: "NY-times", title: "Europe’s Coronavirus Outbreak Worsens, With Italy at Forefront", byLine: "Lohith", abstract: "Italy’s government is taking the extraordinary step of locking down entire sections of the country’s north to fight the virus."),News(id: 1, published_date: "14-03-2020", source: "NY-times", title: "In the U.S., More Than 300 Coronavirus Cases Are Confirmed", byLine: "Lohith", abstract: "Stocks fell as Europe and the U.S. struggled to contain the virus, while the Chinese province at the center of the outbreak reported no new infections outside its capital, Wuhan") ]
    
        let newsList = NewsList(results: articles)
        
        newsArticleListModel.newNewsList(newsList)
        
        XCTAssertEqual(newsArticleListModel.numberOfRowsInSection(newsArticleListModel.numberOfSections), 2,"numberOfRowsInSection required to same as number of articles ")
        
        newsArticleListModel.filterNews("Europe’s")
        
        XCTAssertEqual(newsArticleListModel.isDataFilterd, true,"after did filteration  isDataFilterd required to be true" )
        
        XCTAssertEqual(newsArticleListModel.numberOfRowsInSection(newsArticleListModel.numberOfSections), 1,"numberOfRowsInSection required to same as number of articles ")
        
        
        
    }

    

}
