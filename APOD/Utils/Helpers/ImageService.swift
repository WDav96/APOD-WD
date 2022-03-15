//
//  ImageService.swift
//  APOD
//
//  Created by W.D. on 2/03/22.
//

import UIKit

protocol Cancellable {
    // MARK: - Methods
    func cancel()
}

extension URLSessionTask: Cancellable {

}

final class ImageService {
    
    private var images = NSCache<NSString, NSData>()

    // MARK: - Public API

    func image(for url: URL, completion: @escaping (UIImage?) -> Void) /*-> Cancellable?*/ {
        if let imageData = images.object(forKey: url.absoluteString as NSString) {
          print("using cached images")
            guard let image = UIImage(data: imageData as Data) else { return /*nil*/ }
            completion(image)
          return /*nil*/
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            // Helper
            var image: UIImage?

            defer {
                // Execute Handler on Main Thread
                DispatchQueue.main.async {
                    // Execute Handler
                    completion(image)
                }
            }

            if let data = data {
                // Create Image from Data
                self.images.setObject(data as NSData, forKey: url.absoluteString as NSString)
                image = UIImage(data: data)
            }
        }

        // Resume Data Task
        dataTask.resume()

        //return dataTask
    }

}
