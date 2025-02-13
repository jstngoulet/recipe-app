//
//  VideoLinkButton.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 Button for opening a video link
 */
struct VideoLinkButton: View {
    
    /// The location of the url to open
    private var location: String
    
    /// Init with a specified location url
    /// - Parameter url: The URL to open in safari
    init(url: String) {
        self.location = url
    }
    
    /// Create the view using an icon component
    var body: some View {
        IconLinkButton(
            url: location,
            iconName: "arrow.up.right.video.fill"
        )
    }
}

#Preview {
    VideoLinkButton(url: "")
}
