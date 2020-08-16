//
//  Button+Extension.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    private func imageWithColor(color: UIColor) -> UIImage? {
        
        defer {
             UIGraphicsEndImageContext()
        }
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        return image
    }

    func setBackgroundColor(color: UIColor, forUIControlState state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}
