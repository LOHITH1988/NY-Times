//
//  News.swift
//  NY Times
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation

struct News : Codable {

    var id : Int?
    var published_date : String?
    var source : String?
    var title : String?
    var byLine : String?
    var abstract : String?
    var url : String?
    
}
