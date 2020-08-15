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
    private var weatherList = [Weather]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchWeatherList()
    }
    @IBAction func didSelectCity(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! SearchCityViewController
        if let searchedItem = sourceViewController.selectedSearchItem {
            weatherService.getCurrentWeather(latitude: searchedItem.lat, longitude: searchedItem.lon) { (error, weather) in
                
            }
        }
    }
}

extension CurrentWeatherViewController {
    func fetchWeatherList() {
        let moc = AppDelegate.shared.persistentContainer.newBackgroundContext()
        weatherList = Weather.fetchWeatherList(context: moc)
        print(weatherList.count)
    }
}
