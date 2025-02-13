//
//  IconLinkButton.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/13/25.
//

import SwiftUI

/**
 Standard class for an icon link button. Base component
 */
struct IconLinkButton: View {
    
    /// The url of the location to open in safari
    private let location: String
    
    /// The name of the icon to set in the view (system icon)
    private let iconName: String
    
    /// Init the button with a url and icon name
    /// - Parameters:
    ///   - url:        The unchecked url to open
    ///   - iconName:   The system icon name to open (SF Symbol)
    init(url: String, iconName: String) {
        self.location = url
        self.iconName = iconName
    }
    
    /// Creates the standard body of the icon body
    var body: some View {
        Button(action: {
            guard let url = URL(string: location)
            else { return }
            UIApplication.shared.open(url)
        }) {
            Image(
                systemName: self.iconName
            )
        }.foregroundStyle(Color.white)
            .padding()
            .frame(width: 42, height: 42)
            .buttonStyle(.plain)        //  This prohibits multiple actions from being called
            .accessibilityIdentifier("com.button.iconlink")
            .accessibilityLabel(Text("Open in Safari"))
    }
}
