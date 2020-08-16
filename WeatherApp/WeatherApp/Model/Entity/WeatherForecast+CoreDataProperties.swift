//
//  WeatherForecast+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherForecast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherForecast> {
        return NSFetchRequest<WeatherForecast>(entityName: "WeatherForecast")
    }

    @NSManaged public var id: String?
    @NSManaged public var weatherList: NSSet?
    @NSManaged public var city: City?

}

// MARK: Generated accessors for weatherList
extension WeatherForecast {

    @objc(addWeatherListObject:)
    @NSManaged public func addToWeatherList(_ value: Weather)

    @objc(removeWeatherListObject:)
    @NSManaged public func removeFromWeatherList(_ value: Weather)

    @objc(addWeatherList:)
    @NSManaged public func addToWeatherList(_ values: NSSet)

    @objc(removeWeatherList:)
    @NSManaged public func removeFromWeatherList(_ values: NSSet)

}
