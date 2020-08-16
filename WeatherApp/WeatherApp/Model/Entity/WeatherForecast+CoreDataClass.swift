//
//  WeatherForecast+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(WeatherForecast)
public class WeatherForecast: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id, city
        case weatherList = "list"
        
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "WeatherForecast", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = UUID().uuidString
        city = try values.decode(City.self, forKey: .city)
        weatherList = NSSet(array: try values.decode([Weather].self, forKey: .weatherList))
    }
    
}
