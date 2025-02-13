//
//  GetRecipeRequest.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

/**
 The class used to create a request for the fetching of a standard list
 */
class GetRecipeRequest: Request {
    
    /// Intiiaze the request to fetch a list of standard recipes
    init() {
        super.init(
            requestMethod: .get,
            path: "/recipes.json"
        )
    }
    
}
