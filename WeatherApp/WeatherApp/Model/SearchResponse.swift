//
//  LocationGeocoder.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation

// MARK: - SearchResponseElement
struct SearchResponse: Codable {
    let placeID: String
    let licence: String
    let osmType, osmID: String
    let boundingbox: [String]
    let lat, lon, displayName, searchResponseClass: String
    let type: String
    let importance: Double
    let icon: String

    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
        case licence
        case osmType = "osm_type"
        case osmID = "osm_id"
        case boundingbox, lat, lon
        case displayName = "display_name"
        case searchResponseClass = "class"
        case type, importance, icon
    }
}


