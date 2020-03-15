//
//  NavigationBarControllerViewController.swift
//  NY Times
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import UIKit

class NavigationBarControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpApearence()
        
        // Do any additional setup after loading the view.
    }
    

    
    func setUpApearence(){
        
        let navigationBarColor =  UIColor(named: ColorsStrings.navigationColor)!
        
        
         if #available(iOS 13.0, *) {
            
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = navigationBarColor
            navigationBar.tintColor = .white
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            
        }
         else{
            

            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.backgroundColor : navigationBarColor
            ]
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().tintColor = .white
        }
        
        
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
