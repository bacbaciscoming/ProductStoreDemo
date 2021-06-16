//
//  UIViewController+Extension.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import UIKit

extension UIViewController{
    
    func showErrorDialog(message : String, completion: @escaping () -> ()){
        
        let errorDialog = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        errorDialog.modalPresentationCapturesStatusBarAppearance = true
        errorDialog.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: completion)
        }))
        showDetailViewController(errorDialog, sender: nil)
    }
}
