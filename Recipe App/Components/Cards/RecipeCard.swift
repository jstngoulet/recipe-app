//
//  RecipeCard.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 The standard recipe card for the view
 */
struct RecipeCard: View {
    
    /// The recipe to display in the cell
    @State
    private var recipe: Recipe
    
    /// Init the view with the provided recipe to build
    /// - Parameter recipe: The reciep to map out
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    /// Create the body
    var body: some View {
        
        /// This could be in a constants file, but this is currently
        /// the only class that uses the standard offset
        let viewOffset = 8.0
        
        //  The vertical stack container
        VStack(
            alignment: .leading
        ) {
            TitleLabel(text: recipe.name)
            CaptionLabel(text: recipe.cuisine)
            
            AsyncImageView(
                url: recipe.photoUrlSmall ?? recipe.photoUrlLarge ?? "", 
                placeholder: Image("Placeholder_Image")
            )
            .aspectRatio(contentMode: .fit)
            .padding(.top, viewOffset)
            .overlay(alignment: .bottomTrailing) {
                
                /// The buttons may not always be present
                /// so we should only add the buttons when they are valid
                HStack {
                    if let sourceUrl = recipe.sourceUrl {
                        ExternalLinkButton(url: sourceUrl)
                    }
                    
                    Spacer()
                    
                    if let youtubeUrl = recipe.youtubeUrl {
                        VideoLinkButton(url: youtubeUrl)
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeCard(
        recipe: Recipe(
            cuisine: "British",
            name: "Bakewell Tart",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            id: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            sourceUrl: "https://some.url/index.html",
            youtubeUrl: "https://www.youtube.com/watch?v=some.id"
        )
    )
}
