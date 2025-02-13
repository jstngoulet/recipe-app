//
//  Recipe.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

/**
 The structure for a REcipe from the server
 */
struct Recipe: Codable, Identifiable, Equatable {
    
    /// The cuisine of the recipe.
    let cuisine: String
    
    /// The name of the recipe.
    let name: String
    
    /// The URL of the recipes’s full-size photo.
    let photoUrlLarge: String?
    
    /// The URL of the recipes’s small photo. Useful for list view.
    let photoUrlSmall: String?
    
    /// The unique identifier for the receipe. Represented as a UUID.
    let id: String
    
    /// The URL of the recipe's original website.
    let sourceUrl: String?
    
    /// The URL of the recipe's YouTube video.
    let youtubeUrl: String?
    
    init(
        cuisine: String,
        name: String,
        photoUrlLarge: String?,
        photoUrlSmall: String?,
        id: String,
        sourceUrl: String?,
        youtubeUrl: String?
    ) {
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.id = id
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
    }
    
    private enum CodingKeys: String, CodingKey {
        case cuisine        = "cuisine"
        case name           = "name"
        case photoUrlLarge  = "photo_url_large"
        case photoUrlSmall  = "photo_url_small"
        case id             = "uuid"
        case sourceUrl      = "source_url"
        case youtubeUrl     = "youtube_url"
    }
    
}
