//
//  GetInvalidRecipeRequest.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

/**
 The class used to create a request for the fetching of an invalid list
 */
class GetInvalidRecipeRequest: Request {
    
    /// Intiiaze the request to fetch a list of some invalid objects
    init() {
        super.init(
            requestMethod: .get,
            path: "/recipes-malformed.json"
        )
    }
    
}
