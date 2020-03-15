//
//  MenuViewModel.swift
//  NY Times
//
//  Created by Lohith on 14/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation


struct MenuViewModel{
    
    let  selectedPeriod : Period
    
    init(selectedPeriod : Period) {
        self.selectedPeriod = selectedPeriod
    }
    
    var numberOfSection : Int {
        return 0
    }
    
    var periodList : [Period] = [.daily , .weekly , .monthly]
    
    var numberOfRowsAtSection : Int{
        return periodList.count
    }
    
    func getCellTextForIndex(_ index : Int ) -> String{
        
    
        return getSelectedPeriod(index).stringValue
    }
    
    func isCellIsSelectedCell( _ index : Int) -> Bool{
        
       
        
        return getSelectedPeriod(index) == selectedPeriod
    }
    
    func getSelectedPeriod(_ index : Int)->Period{
        
         if index < periodList.count {
             return periodList[index]
        }
        fatalError("Index out of bound")

       
    }
    
}

extension MenuViewModel : AppViewModel{
   
    var screenTitle: String {
        
        return "Select Period"
    }
    
    
}
