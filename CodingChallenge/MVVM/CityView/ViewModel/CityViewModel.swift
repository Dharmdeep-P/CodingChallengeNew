//
//  CityViewModel.swift
//  CodingChallenge
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import SwiftUI

class CityViewModel: ObservableObject  {
    @Published var groupedCities: [String: [CitiesModel]] = [:]
    

    func loadData()  {
        guard let url = Bundle.main.url(forResource: "au_cities", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        do {
            let data = try Data(contentsOf: url)
            let cities = try JSONDecoder().decode([CitiesModel].self, from: data)
            
            groupedCities = Dictionary(grouping: cities, by: { $0.adminName })
        } catch {
            print("Error loading or decoding data: \(error)")
        }
    }
    
    func reverseCities(for state: String) {
        if let citiesInState = groupedCities[state] {
            groupedCities[state] = citiesInState.reversed()
        }
    }
     
}
