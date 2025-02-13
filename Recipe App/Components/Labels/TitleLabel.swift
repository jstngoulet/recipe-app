//
//  TitleLabel.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 Standard title label component.
 */
public struct TitleLabel: View {
    
    /// The model that observes the text changes, and updates the current text displayed
    @ObservedObject
    private(set) var model: TextModel
    
    /// The current displayed text on the view
    @State
    private var displayedText: Text
    
    /// Init with base text, which can later be updated
    /// - Parameter text: The starting text
    public init(text: String) {
        self.model          = TextModel(textDisplayed: text)
        self.displayedText  = Text(text)
    }
    
    public var body: some View {
        displayedText
            .multilineTextAlignment(.leading)
            .font(.title)
            .onReceive(self.model.$text) { newText in
                displayedText = newText
            }
    }
    
    /// Public accessor to set the text
    /// - Parameter text: The text to set on the label
    func set(text: String) {
        model.displayedText = text
    }
}

#Preview {
    TitleLabel(text: "Hello World")
}
