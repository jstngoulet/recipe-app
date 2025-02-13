//
//  ExploreDomain.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//
import Foundation

class ExploreDomain: Domain {
    
    /// Gets a list of all recipes
    /// - Returns:  The full list of recieps
    class func getAllRecipies() async throws -> [Recipe] {
        try await getRecipes(request: GetRecipeRequest())
    }
    
    /// Gets the data for an empty list of recipes
    /// - Returns: An empty list of recipes
    class func getEmptyRecipes() async throws -> [Recipe] {
        try await getRecipes(request: GetEmptyRecipeRequest())
    }
    
    /// Gets invalid list of recipes,
    /// - Note:     will throw invalid contract error when decoding
    /// - Returns:  Does not return; error thrown
    class func getInvalidRecipies() async throws -> [Recipe] {
        try await getRecipes(request: GetInvalidRecipeRequest())
    }
    
    /// Helper function to get a list of recipies from the provided request
    /// - Parameter request:    The request to fetch from
    /// - Returns:              The list of recipes, when found
    private class func getRecipes(request: Request) async throws -> [Recipe] {
        let data = try await RESTClient.perform(
            request: request
        )
        
        guard let response = try? JSONDecoder().decode(GetRecipeResponse.self, from: data)
        else { throw RESTClient.RestClientError.invalidContract }
        
        return response.recipes
    }
    
}
