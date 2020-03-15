//
//  UIViewController+Extenssion.swift
//  NY Times
//
//  Created by Lohith on 15/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    func topMostViewController() -> UIViewController? {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
    
    func showErrorAlert(message: String){
        
        let alertController: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func showSucessAlert(message: String){
        
        let alertController: UIAlertController = UIAlertController(title: "Sucess", message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }

}

public extension UIApplication {
    func topMostViewController() -> UIViewController? {
    
        let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        
        return keyWindow?.rootViewController?.topMostViewController()
        
    }
}
