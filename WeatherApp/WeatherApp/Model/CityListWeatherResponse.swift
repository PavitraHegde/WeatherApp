//
//  CityListWeatherResponse.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation

struct CityListWeatherResponse: Decodable {
    
    let cnt: Int
    let weatherList: [Weather]
    
    enum CodingKeys: String,CodingKey {
        case cnt
        case weatherList = "list"
    }
}


