//
//  GetEmptyRecipeRequest.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

/**
 The class used to create a request for the fetching of an empty list
 */
final class GetEmptyRecipeRequest: Request {
    
    /// Intiiaze the request to fetch a list of empty objects
    init() {
        super.init(
            requestMethod: .get,
            path: "/recipes-empty.json"
        )
    }
    
}
