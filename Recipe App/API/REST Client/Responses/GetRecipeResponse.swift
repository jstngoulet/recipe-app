//
//  GetRecipeResponse.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import Foundation

/**
 The standard response for the success contract of the recipe list
 */
class GetRecipeResponse: Codable {
    
    //  The single array of recipes found within the object
    let recipes: [Recipe]
}

