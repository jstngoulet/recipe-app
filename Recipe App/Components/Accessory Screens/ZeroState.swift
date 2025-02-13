//
//  ZeroState.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/11/25.
//

import SwiftUI

/**
 Screen for when there are not any items found
 */
struct ZeroState: View {
    
    /// Current message to display
    @State
    private var message: String
    
    /// The mesasge to display
    /// - Parameter message: The text string to display under the image
    init(message: String) {
        self.message = message
    }
    
    var body: some View {
        VStack() {
            Spacer()
            Image("Empty")
                .resizable()
                .frame(width: 120, height: 120)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            AlertCenterLabel(text: message)
                .padding()
            
            Spacer()
        }.padding()
    }
}

#Preview {
    ZeroState(message: "No Content Found")
}
