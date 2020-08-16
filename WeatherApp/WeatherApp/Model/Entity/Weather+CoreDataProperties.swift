//
//  Weather+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData


extension Weather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather> {
        return NSFetchRequest<Weather>(entityName: "Weather")
    }

    @NSManaged public var base: String?
    @NSManaged public var cityId: Int64
    @NSManaged public var cod: Int64
    @NSManaged public var date: Date?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var timezone: Int64
    @NSManaged public var visibility: Int64
    @NSManaged public var location: Location?
    @NSManaged public var main: Main?
    @NSManaged public var sys: Sys?
    @NSManaged public var weatherAtrributes: NSSet?
    @NSManaged public var wind: Wind?
    @NSManaged public var weatherForecast: WeatherForecast?

}

// MARK: Generated accessors for weatherAtrributes
extension Weather {

    @objc(addWeatherAtrributesObject:)
    @NSManaged public func addToWeatherAtrributes(_ value: WeatherAttributes)

    @objc(removeWeatherAtrributesObject:)
    @NSManaged public func removeFromWeatherAtrributes(_ value: WeatherAttributes)

    @objc(addWeatherAtrributes:)
    @NSManaged public func addToWeatherAtrributes(_ values: NSSet)

    @objc(removeWeatherAtrributes:)
    @NSManaged public func removeFromWeatherAtrributes(_ values: NSSet)

}
