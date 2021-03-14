//
//  Alert.swift
//  CAInfotech
//
//  Created by k sujeet sudhakar nag on 11/12/20.
//

import Foundation
import UIKit
class AlertClass {

   
    class func showAlert(title: String, msg: String, viewController: UIViewController)
    {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
 //
 //        vc.present(alert, animated: true)

         var topController: UIViewController = UIApplication.shared.windows.first{ $0.isKeyWindow}! .rootViewController!
         while (topController.presentedViewController != nil) {
             topController = topController.presentedViewController!
             //topController.present(alert, animated: true, completion: nil)

         }
          topController.present(alert, animated: true, completion: nil)
     }
     
    }

}
class LogoutAlertClass {
    
class func alertForLogout(title: String, message: String,viewController:UIViewController) {
    
 let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
     alert.addAction (UIAlertAction(title: "Ok", style: .default) { (alertAction) in
        
        let vc = ViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
        viewController.present(vc, animated: true, completion: nil)
        }
     })


     alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (alertAction) in })
    viewController.present(alert, animated:true, completion: nil)
}


}
