//
//  UIViewController + Ext.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 22.05.2023.
//

import UIKit

extension UIViewController {
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
