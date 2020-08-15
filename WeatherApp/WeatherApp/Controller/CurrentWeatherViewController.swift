//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Pavitra on 14/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    private let weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didSelectCity(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! SearchCityViewController
        if let searchedItem = sourceViewController.selectedSearchItem {
            weatherService.getCurrentWeather(latitude: searchedItem.lat, longitude: searchedItem.lon) { (error, weather) in
                
            }
        }
    }
}
