//
//  RecipeList.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 The basic recipe list to display
 */
struct RecipeList: View {
    
    /// The view model that handles the fetching and displaying the views
    @ObservedObject
    private var viewModel: RecipeListViewModel = RecipeListViewModel()
    
    @State
    private var currentState: RecipeLoaderState = .loading
    
    /// Init with a list o recipes to display
    /// - Parameter recipies: The list of `Recipe`s to display
    init(recipies: [Recipe]) {
        viewModel.set(recipes: recipies)
    }
    
    //  Fetch from API
    init() {
        viewModel.loadRecipes()
    }
    
    /// Based on the state, eitehr show loading, zero or list
    var body: some View {
        switch viewModel.currentState {
        case .loading:
            LoadingState(message: "Loading Content")
        case .complete(let items):
            List(items) {
                RecipeCard(recipe: $0)
            }.listStyle(.plain)
                .tint(.clear)
        case .empty:
            ZeroState(message: "No Content Found")
        case .failed(let err):
            ErrorState(errorMessage: err.localizedDescription)
        }
    }
}

#Preview("Loaded") {
    RecipeList(
        recipies: [
            Recipe(
                cuisine: "British",
                name: "Bakewell Tart",
                photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                id: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
                sourceUrl: "https://some.url/index.html",
                youtubeUrl: "https://www.youtube.com/watch?v=some.id"
            ),
            Recipe(
                cuisine: "British",
                name: "Bakewell Tart",
                photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                id: "12345",
                sourceUrl: "https://some.url/index.html",
                youtubeUrl: "https://www.youtube.com/watch?v=some.id"
            ),
            Recipe(
                cuisine: "British",
                name: "Bakewell Tart",
                photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
                photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
                id: "asdfghjkl",
                sourceUrl: "https://some.url/index.html",
                youtubeUrl: "https://www.youtube.com/watch?v=some.id"
            )
        ]
    )
}

#Preview("API") {
    RecipeList()
}
