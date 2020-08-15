//
//  Main+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Main)
public class Main: NSManagedObject, Decodable {

    enum CodingKeys: String, CodingKey {
        case humidity,pressure, temp
        case tempMax = "temp_max"
        case tempMin = "temp_min"
        case feelsLike = "feels_like"
        
    }
    
    public required init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
        let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Main", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        super.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        humidity = try values.decode(Double.self, forKey: .humidity)
        pressure = try values.decode(Double.self, forKey: .pressure)
        temp = try values.decode(Double.self, forKey: .temp)
        tempMin = try values.decode(Double.self, forKey: .tempMin)
        tempMax = try values.decode(Double.self, forKey: .tempMax)
        feelsLike = try values.decode(Double.self, forKey: .feelsLike)
        
        
    }
    
    
}
