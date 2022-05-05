//
//  HomeInteractor.swift
//  APOD
//
//  Created by W.D. on 4/05/22.
//

import Foundation

class HomeInteractor {
    
    func getLastsApods(onCompletion: @escaping ((Result<[Apod], Error>) -> Void)) {
        let currentDateInString = Date().toString()
        guard let startDateInString = Date().removing(days: 6) else {
            return
        }
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Y8ZCyniqIkFFF2pXFiGjfMLuusPTZ14kTzBnaQk9&start_date=\(startDateInString)&end_date=\(currentDateInString)") else {
            return
        }
        URLSession.shared.fetchData(at: url) { result in
            switch result {
            case .success(let apods):
                DispatchQueue.main.async {
                    onCompletion(.success(apods))
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
}
