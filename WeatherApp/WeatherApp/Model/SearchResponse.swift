//
//  LocationGeocoder.swift
//  WeatherApp
//
//  Created by Pavitra on 15/08/20.
//  Copyright © 2020 Pavitra Hegde. All rights reserved.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let placeID: String
    let licence: String
    let osmType, osmID: String
    let boundingbox: [String]
    let lat, lon, displayName, searchResponseClass: String
    let type: String
    let importance: Double
    let icon: String?
    let address: Address

    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
        case licence
        case osmType = "osm_type"
        case osmID = "osm_id"
        case boundingbox, lat, lon
        case displayName = "display_name"
        case searchResponseClass = "class"
        case type, importance, icon,address
    }
}

// MARK: - Address
struct Address: Codable {
    let town: String?
    let county: String?
    let stateDistrict, state, postcode: String?
    let country, countryCode: String?
    let station, road, hamlet, village: String?

    enum CodingKeys: String, CodingKey {
        case town, county
        case stateDistrict = "state_district"
        case state, postcode, country
        case countryCode = "country_code"
        case station, road, hamlet, village
    }
}

