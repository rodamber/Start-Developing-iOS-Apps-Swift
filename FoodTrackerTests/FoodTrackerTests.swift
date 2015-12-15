//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rodrigo Bernardo on 14/12/2015.
//
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization() {
        // Success cases.
        XCTAssertNotNil(Meal(name: "Newest meal", photo: nil, rating: 5))
        
        // Failure cases.
        XCTAssertNil(Meal(name: "", photo: nil, rating: 0), "Empty name is invalid")
        XCTAssertNil(Meal(name: "Really bad rating", photo: nil, rating: -1), "Negative rating is invalid")
    }
    
}
