//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation
import CoreData

class WeatherService {
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
    private let defaultQueryParams = ["appid" : "178550ab675e021bf4792bfcdf7aa373"]
    
    enum WeatherEndPoint: String {
        
        case weather = "weather"
        
    }
    
    func getCurrentWeather(latitude: String, longitude: String, completionHandler: @escaping (_ errorMessage: String?, _ response: Weather?) -> Void ) {
        
        let urlWithPath = "\(baseURL)\(WeatherEndPoint.weather.rawValue)"
        var urlComponent = URLComponents(string: urlWithPath)
        var queryParams = ["lat": latitude, "lon": longitude]
        defaultQueryParams.forEach {queryParams[$0.key] = $0.value}
        urlComponent?.queryItems = queryParams.map(URLQueryItem.init)
        if let url = urlComponent?.url {
            let dataTask = SessionManager.shared.defaultSession.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    completionHandler(error.localizedDescription, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.isSucces else {
                    completionHandler(error?.localizedDescription, nil)
                    return
                }
                
                guard let responseData = data else {
                    completionHandler("No Data", nil)
                    return
                }
                
                let moc = AppDelegate.shared.persistentContainer.viewContext
                let jsonDeocder = JSONDecoder()
                jsonDeocder.dateDecodingStrategy = .secondsSince1970
                jsonDeocder.userInfo[CodingUserInfoKey.context!] = moc
                do {
                    let weatherResponse = try jsonDeocder.decode(Weather.self, from: responseData)
                    try moc.save()
                    completionHandler(nil, weatherResponse)
                } catch let parseError as NSError {
                    print(parseError.userInfo)
                    completionHandler("Something went wrong", nil)
                }
                
            }
            dataTask.resume()
        }
    }
    
}
