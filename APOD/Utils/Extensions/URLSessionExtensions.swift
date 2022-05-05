//
//  URLSessionExtensions.swift
//  APOD
//
//  Created by W.D. on 4/03/22.
//

import Foundation

extension URLSession {
    
    func fetchData(at url: URL, completion: @escaping (Result<[Apod], Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let apods = try JSONDecoder().decode([Apod].self, from: data)
                    completion(.success(apods))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }
        .resume()
    }
    
}
