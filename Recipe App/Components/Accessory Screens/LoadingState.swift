//
//  LoadingState.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 Basic Screen for loading state
 */
struct LoadingState: View {
    
    /// Current message to display
    @State
    private var message: String
    
    /// The mesasge to display
    /// - Parameter message: The text string to display under the image
    init(message: String) {
        self.message = message
    }
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.automatic)
            
            AlertCenterLabel(text: message)
                .padding()
        }.padding()
    }
}

#Preview {
    LoadingState(message: "Loading Content")
}
