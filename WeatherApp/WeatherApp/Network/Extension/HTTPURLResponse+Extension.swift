//
//  HTTPURLResponse+Extension.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    
    var isSucces: Bool {
        return (200...299).contains(self.statusCode)
    }
}
