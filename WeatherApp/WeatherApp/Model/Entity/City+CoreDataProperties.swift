//
//  City+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var timezone: Int64
    @NSManaged public var sunrise: Date?
    @NSManaged public var sunset: Date?
    @NSManaged public var location: Location?
    @NSManaged public var weatherForecast: WeatherForecast?

}
