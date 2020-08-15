//
//  WeatherAttributes+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData


extension WeatherAttributes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherAttributes> {
        return NSFetchRequest<WeatherAttributes>(entityName: "WeatherAttributes")
    }

    @NSManaged public var desc: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: Int64
    @NSManaged public var main: String?
    @NSManaged public var weather: Weather?

}
