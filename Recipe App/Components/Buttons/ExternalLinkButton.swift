//
//  ExternalLinkButton.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 The view for an external link buton
 */
struct ExternalLinkButton: View {
    
    /// The location to take the user when tapped
    private var location: String
    
    /// Initiaze the button with a location as the button is
    /// already themed in
    /// - Note:             URL safety check happens on selection
    /// - Parameter url:    The location url to bring the user to.
    init(url: String) {
        self.location = url
    }
    
    /// The primary body of the button
    var body: some View {
        IconLinkButton(
            url: location,
            iconName: "square.and.arrow.down.fill"
        ).accessibilityIdentifier("com.button.externalLinkButton")
    }
}

#Preview {
    ExternalLinkButton(url: "")
}
