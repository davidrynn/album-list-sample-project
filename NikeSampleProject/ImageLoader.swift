//
//  ImageLoader.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/12/20.
//

import UIKit

protocol ImageLoaderProtocol: class {

    /// Loads images from supplied optional url with a default image for invalid url.  Loads on background thread.  Must manually update UI on main thread after.
    /// - Parameters:
    ///   - urlString: String used to create URL
    ///   - completion: Completion triggered when image is loaded asynchronously
    func loadImage(urlString: String?, completion: @escaping (UIImage) -> Void)
}

final class ImageLoader: ImageLoaderProtocol, ObservableObject {

    /// Cache is used to save images per session so that once images are loaded they don't need to be reloaded when views are changed.
    let imageCache = NSCache<NSString, UIImage>()

    func loadImage(urlString: String?, completion: @escaping (UIImage) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(UIImage(systemName: "photo")!)
            return
        }
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage)
        }
        // load image on background thread - must set on main thread at call.
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                self?.imageCache.setObject(image, forKey: urlString as NSString)
                completion(image)
            } else {
                completion(UIImage(systemName: "photo")!)
            }
        }
    }
}

