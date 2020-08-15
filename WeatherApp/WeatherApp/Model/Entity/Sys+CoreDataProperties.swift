//
//  Sys+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData


extension Sys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sys> {
        return NSFetchRequest<Sys>(entityName: "Sys")
    }

    @NSManaged public var country: String?
    @NSManaged public var id: Int64
    @NSManaged public var sunrise: Int64
    @NSManaged public var sunset: Int64
    @NSManaged public var type: Int64
    @NSManaged public var weather: Weather?

}
