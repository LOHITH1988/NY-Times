//
//  NY_TimesTests.swift
//  NY TimesTests
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import XCTest
@testable import NY_Times

class NY_TimesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetBaseUrlIsValidURL() {
        
         XCTAssertNotNil(Webservice.getCompleteUrl(.daily) , "Base url constrction is wrong")
        
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}
