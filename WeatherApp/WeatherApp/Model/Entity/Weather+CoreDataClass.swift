//
//  Weather+CoreDataClass.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Weather)
public class Weather: NSManagedObject, Decodable {
    
    enum TemperatureFormat {
        case celsius
        case farhenheit
    }
    
    enum CodingKeys: String, CodingKey {
        case base
        case cityId = "id"
        case cod
        case date = "dt"
        case name
        case timezone
        case visibility
        case location = "coord"
        case main
        case sys
        case weatherAtrributes = "weather"
        case wind
        
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Weather", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        base = try values.decodeIfPresent(String.self, forKey: .base)
        cityId = try values.decodeIfPresent(Int64.self, forKey: .cityId) ?? -1
        cod = try values.decodeIfPresent(Int64.self, forKey: .cod) ?? -1
        date = try values.decodeIfPresent(Date.self, forKey: .date)
        id = UUID().uuidString
        name = try values.decodeIfPresent(String.self, forKey: .name)
        timezone = try values.decodeIfPresent(Int64.self, forKey: .timezone) ?? -1
        visibility = try values.decodeIfPresent(Int64.self, forKey: .visibility) ?? -1
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        weatherAtrributes = NSSet(array: try values.decode([WeatherAttributes].self, forKey: .weatherAtrributes))
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
    }
    
    static func fetchCurrentWeatherList(context: NSManagedObjectContext) -> [Weather] {
        let predicate = NSPredicate(format: "weatherForecast == nil")
        return fetchWeatherList(context: context, predicate: predicate)
    }
    
    static func fetchWeatherList(context: NSManagedObjectContext, predicate: NSPredicate? = nil) -> [Weather] {
        let fetchRequest: NSFetchRequest<Weather> = Weather.fetchRequest()
        fetchRequest.predicate = predicate
        var weatherList = [Weather]()
        context.performAndWait {
            do {
                weatherList = try fetchRequest.execute()
            } catch {
                print(error.localizedDescription)
            }
        }
        return weatherList
    }
    
    func getFormattedTemperature(format: TemperatureFormat) -> Int?{
        
        guard let temp = main?.temp else {
            return nil
        }
        switch format {
        case .farhenheit:
            return Int(9/5*(temp - 273) + 32)
        case .celsius:
            return Int(temp - 273.15)
        }
    }
    
    func getFormattedDate() -> String? {
        guard let date = date else { return nil }
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    static func deleteCurrentWeatherList(context: NSManagedObjectContext) {
        fetchCurrentWeatherList(context: context).forEach { (weather) in
            context.delete(weather)
        }
        do {
            try context.save()
        } catch  {
            print("delete failed :\(error.localizedDescription)")
        }
    }

}

