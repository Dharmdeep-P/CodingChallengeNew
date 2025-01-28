//
//  CitiesModel.swift
//  CodingChallenge
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import Foundation

struct CitiesModel: Codable, Identifiable, Equatable {
    let id = UUID()
    let city, lat, lng: String
    let country: Country
    let iso2: Iso2
    let adminName: String
    let capital: Capital
    let population, populationProper: String
    
    enum CodingKeys: String, CodingKey {
        case city, lat, lng, country, iso2
        case adminName = "admin_name"
        case capital, population
        case populationProper = "population_proper"
    }
    var expandable = false
    
    mutating func toggleExpandable() {
        expandable.toggle()
    }
    
    static func == (lhs: CitiesModel, rhs: CitiesModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.city == rhs.city &&
        lhs.lat == rhs.lat &&
        lhs.lng == rhs.lng &&
        lhs.country == rhs.country &&
        lhs.iso2 == rhs.iso2 &&
        lhs.adminName == rhs.adminName &&
        lhs.capital == rhs.capital &&
        lhs.population == rhs.population &&
        lhs.populationProper == rhs.populationProper &&
        lhs.expandable == rhs.expandable
    }
}

enum Capital: String, Codable {
    case admin = "admin"
    case empty = ""
    case primary = "primary"
}

enum Country: String, Codable {
    case australia = "Australia"
}

enum Iso2: String, Codable {
    case au = "AU"
}
