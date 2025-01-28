//
//  CityViewModelTests.swift
//  CodingChallengeTests
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import XCTest
@testable import CodingChallenge

final class CityViewModelTests: XCTestCase {

    var viewModel: CityViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CityViewModel()
        
        let arrCities: [CitiesModel] = [
            CitiesModel(city: "Sydney", lat: "33.8688", lng: "151.2093", country: .australia, iso2: .au, adminName: "New South Wales", capital: .primary, population: "4840600", populationProper: "4840600"),
            CitiesModel(city: "Newcastle", lat: "32.9272", lng: "151.7765", country: .australia, iso2: .au, adminName: "New South Wales", capital: .empty, population: "322278", populationProper: "322278"),
            CitiesModel(city: "Melbourne", lat: "37.8136", lng: "144.9631", country: .australia, iso2: .au, adminName: "Victoria", capital: .primary, population: "4246375", populationProper: "4246375")
        ]
        
        viewModel.groupedCities = Dictionary(grouping: arrCities, by: { $0.adminName })
        
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testReverseCities() {
        // Ensure the initial order of cities in "New South Wales"
        let state = "New South Wales"
        XCTAssertEqual(viewModel.groupedCities[state]?.map { $0.city }, ["Sydney", "Newcastle"])
        
        // Reverse cities in "New South Wales"
        viewModel.reverseCities(for: state)
        
        // Verify the order is reversed
        XCTAssertEqual(viewModel.groupedCities[state]?.map { $0.city }, ["Newcastle", "Sydney"])
    }
    
    func testInitialCitiesLoad() {
        // Act
        viewModel.loadData()
        
        // Assert
        XCTAssertNotNil(viewModel.groupedCities, "Cities should not be nil after loading data.")
    }


}
