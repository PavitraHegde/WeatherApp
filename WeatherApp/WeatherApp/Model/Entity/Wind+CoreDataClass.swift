//
//  Wind+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Wind)
public class Wind: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case deg, speed
        
    }
     public required init(from decoder: Decoder) throws {
          guard let contextUserInfoKey = CodingUserInfoKey.context,
          let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Wind", in: managedObjectContext)
          else {
              fatalError("decode failure")
          }
          super.init(entity: entity, insertInto: managedObjectContext)
          let values = try decoder.container(keyedBy: CodingKeys.self)
        
        deg = try values.decode(Int64.self, forKey: .deg)
        speed = try values.decode(Double.self, forKey: .speed)
    }
        

}
