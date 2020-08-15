//
//  LocationGeocoder.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation

class LocationGeocoder {
    
    private let baseURL = "https://eu1.locationiq.com/"
    private let defaultQueries = ["key" : "pk.de1a8faeffec9dfeb3ba87610fe3f895","format" : "json", "addressdetails" : "1"]
    private var searchDataTask: URLSessionDataTask?
    
    func startGeocoding(query: String, completionHandler: @escaping (_ errorMessage: String?, _ response: [SearchResponse]?) -> Void)  {
        
        var queryParams = ["q" : query]
        defaultQueries.forEach { queryParams[$0.key] = $0.value }
        let fullURL = "\(baseURL)v1/search.php"
        var urlComponent = URLComponents(string: fullURL)
        urlComponent?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value)}
        
        if let url = urlComponent?.url {
            // cancel previous request if exist
            searchDataTask?.cancel()
            searchDataTask =  SessionManager.shared.defaultSession.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    completionHandler(error.localizedDescription, nil)
                }
                
                guard let searchResponse =  response as? HTTPURLResponse, searchResponse.isSucces else{
                    completionHandler(error?.localizedDescription, nil)
                    return
                }
                
                if let responseData = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let searchResponseList =  try jsonDecoder.decode([SearchResponse].self, from: responseData)
                        completionHandler(nil, searchResponseList)
                    } catch let parseError as NSError  {
                        print(parseError.userInfo)
                        completionHandler("Something went wrong!!", nil)
                    }
                } else {
                    completionHandler(nil,[])
                }
            }
            searchDataTask?.resume()
        }
        
    }
}
