//
//  Sys+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Sys)
public class Sys: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case country, id, sunrise, sunset, type
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Sys", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int64.self, forKey: .id) ?? -1
        country = try values.decodeIfPresent(String.self, forKey: .country)
        sunrise = try values.decodeIfPresent(Int64.self, forKey: .sunrise) ?? -1
        sunset = try values.decodeIfPresent(Int64.self, forKey: .sunset) ?? -1
        type = try values.decodeIfPresent(Int64.self, forKey: .type) ?? -1
        
        
    }
    
}


