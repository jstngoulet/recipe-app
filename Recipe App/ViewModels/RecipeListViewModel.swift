//
//  RecipeListViewModel.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/13/25.
//
import SwiftUI

enum RecipeLoaderState {
    case loading
    , complete([Recipe])
    , empty
    , failed(Error)
}

/**
 Model for the standard list, includes loading and zero state
 */
@MainActor
class RecipeListViewModel: ObservableObject {
    
    /// Current state of the view model
    @Published
    private(set) var currentState: RecipeLoaderState = .loading
    
    /// Sets the recipes from a public function
    /// - Parameter recipes: The list of recipes to display
    func set(recipes: [Recipe]) {
        currentState = .complete(recipes)
    }
    
    /// Loads the recipes from a remote server
    func loadRecipes() {
        currentState = .loading
        Task {
            do  {
                let list = try await ExploreDomain.getAllRecipies()
                
                currentState = .complete(list)
                
                currentState = list.isEmpty
                    ? .empty
                    : .complete(list)
                
            } catch {
                currentState = .failed(error)
            }
        }
        
    }
    
}
