//
//  Meal.swift
//  FoodTracker
//
//  Created by Rodrigo Bernardo on 15/12/2015.
//
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name   = name
        self.photo  = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}