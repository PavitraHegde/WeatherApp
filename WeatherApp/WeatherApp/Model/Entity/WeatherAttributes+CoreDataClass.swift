//
//  WeatherAttributes+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(WeatherAttributes)
public class WeatherAttributes: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required convenience init(from decoder: Decoder) throws {
          guard let contextUserInfoKey = CodingUserInfoKey.context,
          let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "WeatherAttributes", in: managedObjectContext)
          else {
              fatalError("decode failure")
          }
          self.init(entity: entity, insertInto: managedObjectContext)
          let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int64.self, forKey: .id)
        desc = try values.decodeIfPresent(String.self, forKey: .weatherDescription)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        main = try values.decodeIfPresent(String.self, forKey: .main)
        
        
    }
        
}

