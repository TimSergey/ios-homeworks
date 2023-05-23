//
//  UIView + Extension.swift
//  Navigation
//
//  Created by Сергей Тимофеев on 27.04.2023.
//

import UIKit

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}

extension UIView {

    func shake(count : Float = 2,for duration : TimeInterval = 0.3,withTranslation translation : Float = 3) {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
}
