//
//  Recipe_AppTests.swift
//  Recipe AppTests
//
//  Created by Justin Goulet on 2/11/25.
//

import XCTest
import SwiftUI
@testable import Recipe_App

final class Recipe_AppTests: XCTestCase {
    
    override func setUp() {
        RESTClient.isLoggingEnabled = true
    }

    func test_standardList() async throws {
        let list = try await ExploreDomain.getAllRecipies()
        XCTAssert(!list.isEmpty, "List is empty")
    }
    
    func test_emptyList() async throws {
        let list = try await ExploreDomain.getEmptyRecipes()
        XCTAssert(list.isEmpty, "List is empty")
    }
    
    func test_invalidList() async throws {
        do {
            _ = try await ExploreDomain.getInvalidRecipies()
        } catch let error as RESTClient.RestClientError{
            XCTAssert(error == .invalidContract)
        } catch {
            throw error
        }
    }
    
    
    /// Test the ability to load an image
    func test_loadImage() async {
        
        let sourceData = await ImageLoader().load(
            ImageSource.unfetched(
                url: URL(string: "https://placekittens.com/200/300")
            )
        )
        
        XCTAssert(sourceData.image != nil)
    }
    
    func test_imageCache() async {
        let loader: ImageLoader = ImageLoader()
        let url: URL? = URL(string: "https://placekittens.com/200/300")
        
        let remote = await loader.load(
            ImageSource.unfetched(
                url: url
            )
        )
        
        let cached = await loader.load(
            ImageSource.unfetched(
                url: url
            )
        )
        
        //  Now, compare the images
        guard case .fetched(let remoteImage) = remote else {
            XCTAssert(false, "Image was not fetched")
            return
        }

        
        guard case .cached(let cachedImage) = cached else {
            XCTAssert(false, "Image was not cached")
            return
        }
        
        XCTAssert(remoteImage == cachedImage, "Images are not the same")
    }
    
    func test_imageError() async throws {
        
        let loader: ImageLoader = ImageLoader()
        let url: URL? = URL(string: "https://mysite.com/200/300")
        
        let error = await loader.load(
            .unfetched(url: url)
        )
        
        guard case .error(let foundError) = error else {
            XCTAssert(false, "Image was not errored")
            return
        }

        guard let imageError = foundError as? ImageLoader.ImageLoaderError
        , case .invalidImage = imageError
        else {
            XCTAssert(false, "Mismathced Error handling")
            return
        }
        
        XCTAssert(true, "Image mapping is not correct")
    }
    
    /// Test a simple label update
    func test_labelUpdate() {
        let startText: String   = "Hello World"
        let endText: String     = "Goodbye World"
        
        let captionLabel = CaptionLabel(text: startText)
        captionLabel.set(text: endText)
        
        XCTAssert(captionLabel.model.displayedText == endText, "Text: \(captionLabel.model.displayedText), compare: \(endText)")
        
    }

}
