//
//  MenuViewModelTest.swift
//  NY TimesTests
//
//  Created by Lohith on 15/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import XCTest
@testable import NY_Times


class MenuViewModelTest: XCTestCase {

    let menuViewModel = MenuViewModel(selectedPeriod: .weekly)
    
    override func setUp() {
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testScreenTitle(){
           
           XCTAssertEqual(menuViewModel.screenTitle, "Select Period","Title is not valid")

    }
    
    func testNumberOfRawsAtSection(){
           
           XCTAssertEqual(menuViewModel.numberOfRowsAtSection, 3,"No. of rows is not matching")

    }
    
    func testCellTextForIndex(){
            
            XCTAssertEqual(menuViewModel.getCellTextForIndex(0), "Daily","Cell text is not matching")

     }
    
    func testIsCellIsSelectedCell(){
               
               XCTAssertEqual(menuViewModel.isCellIsSelectedCell(0), false,"selected Cell not matching")
               XCTAssertEqual(menuViewModel.isCellIsSelectedCell(1), true,"selected Cell not matching")
               XCTAssertEqual(menuViewModel.isCellIsSelectedCell(2), false,"selected Cell not matching")


        }
}
