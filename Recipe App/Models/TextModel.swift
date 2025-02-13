//
//  TextModel.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/13/25.
//

import SwiftUI

/**
 Text model to update the parent label, when needed
 */
final class TextModel: ObservableObject {
    
    /// The current text stored in the model
    @Published
    private(set) var text: Text
    
    /// The current text displayed in the model
    var displayedText: String = "" {
        didSet {
            self.text = Text(displayedText)
        }
    }
    
    /// Init the model with base text
    /// - Parameter textDisplayed: the text to set
    init(textDisplayed: String) {
        self.displayedText  = textDisplayed
        self.text           = Text(textDisplayed)
    }
    
}
