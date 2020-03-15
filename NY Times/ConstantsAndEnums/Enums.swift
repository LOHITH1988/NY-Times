//
//  Enums.swift
//  NY Times
//
//  Created by Lohith on 14/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation


enum ViewState {
    
    case none
    case loading
    case loaded
    case error(String)
    
    
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default :
            return false
        }
        
    }
    
    
}

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Period  : Int{
    
    case daily = 1
    case weekly = 7
    case monthly = 30
    
    
    var stringValue : String{
        
        switch self {
         
          case .daily:
            return "Daily"
     
          case .weekly:
            return "Weekly"
            
          case .monthly:
            return "MonthLy"
      
        }
    }
    
    var toralCount : Int{
        return 3
    }
}



