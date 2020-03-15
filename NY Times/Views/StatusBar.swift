//
//  StatusView.swift
//  NY Times
//
//  Created by Lohith on 14/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation
import UIKit

class StatusBar: UIView {
    
    override func awakeFromNib() {
        
        let navigationBarColor =  UIColor(named: ColorsStrings.navigationColor)!

        self.backgroundColor = navigationBarColor
        
        if let constraint = (self.constraints.filter{$0.firstAttribute == .height}.first) {
            
            
            constraint.constant = UIApplication.shared.statusBarFrame.size.height
            
        }
        
    }
    
}
