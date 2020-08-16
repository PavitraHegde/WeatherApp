//
//  City+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 16/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id, name, country,timezone,sunrise,sunset
        case location = "coord"
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "City", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int64.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        timezone = try values.decodeIfPresent(Int64.self, forKey: .timezone) ?? -1
        sunrise = try values.decodeIfPresent(Date.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Date.self, forKey: .sunrise)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        
    }
}
