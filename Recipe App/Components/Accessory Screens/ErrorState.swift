//
//  ErrorState.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/13/25.
//
import SwiftUI

/**
 Basic Screen for loading state
 */
struct ErrorState: View {
    
    /// The Error Message to display
    @State
    private var errorMessage: String
    
    /// Init the view with the provided error message
    /// - Parameter errorMessage: The text to display
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    /// Create the body of the view
    var body: some View {
        VStack {
            Spacer()
            Image("Error")
                .resizable()
                .frame(width: 165, height: 120)
                .clipped()
                .padding()
            
            AlertCenterLabel(text: errorMessage)
                .padding()
            
            Spacer()
        }.padding()
    }
}

#Preview {
    ErrorState(errorMessage: "Sample Error")
}
