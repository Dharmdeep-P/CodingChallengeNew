//
//  CityView.swift
//  CodingChallenge
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import SwiftUI

struct CityView: View {
    
@StateObject private var cityViewModel = CityViewModel()

    
    var body: some View {
        
        NavigationView {
                    List {
                        ForEach(cityViewModel.groupedCities.keys.sorted(), id: \.self) { state in
                            if let citiesInState = cityViewModel.groupedCities[state] {
                                
                                DisclosureGroup(state) {
                                    

                                    Button("Reverse Cities") {
                                        cityViewModel.reverseCities(for: state)
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .padding(.top, 8)

                                    
                                    ForEach(citiesInState) { city in
                                        VStack(alignment: .leading) {
                                            Text(city.city)
                                                .font(.headline)
                                            Text("Population: \(city.population)")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.vertical, 4)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .navigationTitle("Cities by State")
                    .onAppear {
                        cityViewModel.loadData()
                    }
                }
    }
}

#Preview {
    CityView()
}
