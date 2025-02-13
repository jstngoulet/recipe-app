//
//  ImageLoader.swift
//  Recipe App
//
//  Created by Justin Goulet on 2/12/25.
//
import SwiftUI

/**
 Primary image loader class
 */
class ImageLoader: ObservableObject {
    
    enum ImageLoaderError: LocalizedError {
        case invalid(source: ImageSource)
        case taskCancelled
        case invalidImage(data: Data)
    }
    
    /// The primary image source as the state is changed
    @Published
    var source: ImageSource
    
    /// The local image cache, storing images
    private static var imageCache: NSCache<NSURL, UIImage> = {
        let cache: NSCache<NSURL, UIImage> = NSCache()
        cache.countLimit = 1_000
        return cache
    }()
    
    /// The current task, so it can be cancelled if not needed
    private var currentTask: Task<(), Never>?
    
    /// Load the image loader with an image source and a placeholder (placeholder is optional)
    /// - Parameters:
    ///   - imageSource: The image source to kickstart the loader
    ///   - placeholder: The placeholder to show while image is loading
    init(imageSource: ImageSource, placeholder: Image?) {
        if placeholder == nil {
            source = imageSource
        } else {
            source = .placeholder(image: placeholder)
        }
        
        //  Load the source
        currentTask = Task { @MainActor in
            self.source = await self.load(imageSource)
        }
    }
    
    /// Init with a default empty placeholder
    init() {
        source = .placeholder(image: nil)
    }
    
    /// When removed from memory, cancel the task if active
    deinit {
        cancel()
    }
    
    /// Load the image from the provided source
    /// - Note: The image is only fetched if the status is unfetched
    /// - Parameter source: The image source to fetch from
    func load(_ source: ImageSource) async -> ImageSource {
        guard case .unfetched(let url) = source,
              let url
        else { return .error(ImageLoaderError.invalid(source: source)) }
        
        //  First, check to see if the image is in the cache
        if let img = ImageLoader.imageCache.object(forKey: url as NSURL) {
            return .cached(image: Image(uiImage: img))
        }
        
        //  If the image is not in cache, fetch it
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if Task.isCancelled {
                return .error(ImageLoaderError.taskCancelled)
            }
            
            //  Now, try to get the image from the data
            guard let image = UIImage(data: data)
            else {
                return .error(ImageLoaderError.invalidImage(data: data))
            }
            
            //  Set the object in the cache
            ImageLoader.imageCache.setObject(image, forKey: url as NSURL)
            
            return .fetched(image: Image(uiImage: image))
            
        } catch {
            return .error(error)
        }
    }
    
    /// Cancel the request, if needed
    func cancel() {
        currentTask?.cancel()
        currentTask = nil
    }
    
}
