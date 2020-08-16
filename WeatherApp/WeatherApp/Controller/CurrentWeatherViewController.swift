//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Pavitra on 14/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var celsius: UIButton!
    @IBOutlet weak var tableFooterView: UIView!
    @IBOutlet weak var farhenheit: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private let weatherService = WeatherService()
    private var weatherList = [Weather]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var curentTempFormat: Weather.TemperatureFormat = .celsius {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        fetchWeatherList()
        
    }
    
    //MARK:- IBAction methods
    @IBAction func celsiusButtonTapped(_ sender: UIButton) {
        
        celsius.setTitleColor(.white, for: .normal)
        farhenheit.setTitleColor(.gray, for: .normal)
        curentTempFormat = .celsius
        
    }
    
    @IBAction func farhenheitButtonTapped(_ sender: UIButton) {
        farhenheit.setTitleColor(.white, for: .normal)
        celsius.setTitleColor(.gray, for: .normal)
        curentTempFormat = .farhenheit
    }
    
    @IBAction func didSelectCity(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! SearchCityViewController
        if let searchedItem = sourceViewController.selectedSearchItem {
            fetchWeatherInfo(selectedCity: searchedItem)
        }
    }
}

extension CurrentWeatherViewController {
    func fetchWeatherList() {
        let moc = AppDelegate.shared.persistentContainer.viewContext
        weatherList = Weather.fetchCurrentWeatherList(context: moc)
        print(weatherList.count)
    }
}

//MARK:- TableView DataSource methods
extension CurrentWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherTableViewCell", for: indexPath) as! CurrentWeatherTableViewCell
        let weatherData = weatherList[indexPath.row]
        cell.cityName.text = weatherData.name
        if let temperature = weatherData.getFormattedTemperature(format: curentTempFormat) {
            let tempFormatted = String(format:"\(temperature)%@", "\u{00B0}")
            cell.temp.text = tempFormatted
        } else {
            cell.temp.text = "No data"
        }
        cell.time.text = weatherData.getFormattedDate()
        return cell
    }
}

//MARK:- TableView Delegate methods
extension CurrentWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "WeatherForecastViewController", sender: nil)
    }
    
}

extension CurrentWeatherViewController {
    func initialSetup() {
        let nib = UINib(nibName: "CurrentWeatherTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CurrentWeatherTableViewCell")
        tableView.tableFooterView = tableFooterView
        
    }
}


extension CurrentWeatherViewController {
    private func fetchWeatherInfo(selectedCity: SearchResponse) {
        fetchCurrentWeatherInfo(lat: selectedCity.lat, lon: selectedCity.lon)
        fetchWeatherForecast(lat: selectedCity.lat, lon: selectedCity.lon)
    }
    
    private func fetchCurrentWeatherInfo(lat: String, lon: String) {
        weatherService.getCurrentWeather(latitude: lat, longitude: lon) { (error, weather) in
            if let error = error {
                print(error)
            } else {
                self.weatherList.append(weather!)
            }
        }
        
    }
    
    private func fetchWeatherForecast(lat: String, lon: String) {
        weatherService.getWeatherForecast(latitude: lat, longitude: lon) { (error, weatherForecast) in
            if let error = error {
                print(error)
            } else {
                
            }
        }
    }
}
