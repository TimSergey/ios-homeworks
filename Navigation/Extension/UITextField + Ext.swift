//
//  UITextField + Ext.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 23.05.2023.
//

import UIKit

extension UITextField {
    
    func shakeTF(_ textField: UITextField) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 0.3
        animation.values = [
            NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y)),
            NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y)),
            NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y)),
            NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y)),
            NSValue(cgPoint: CGPoint(x: textField.center.x, y: textField.center.y))
        ]
        textField.layer.add(animation, forKey: "position")
    }
    
    func changeTextFieldColor(textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            textField.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }) { (_) in
            UIView.animate(withDuration: 0.5) {
                textField.backgroundColor = .white
            }
        }
    }
}

