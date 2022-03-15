//
//  MainPresenter.swift
//  APOD
//
//  Created W.D on 4/03/22.
//

import Foundation

protocol PresenterView: AnyObject {
    var apodList: [Apod] { get set }
    func display(data: [Apod])
}

class MainPresenter {
    
    // MARK: - Internal Properties

    weak var view: PresenterView?
    
    // MARK: - Initializers
    
    init(view: PresenterView) {
        self.view = view
    }
    
    // MARK: - Public Methods
    
    func passUrl() {        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Y8ZCyniqIkFFF2pXFiGjfMLuusPTZ14kTzBnaQk9&start_date=2022-03-01&end_date=2022-03-07")!
        
        URLSession.shared.fetchData(at: url) { result in
            switch result {
            case .success(let apods):
                DispatchQueue.main.async {
                    //self.view?.display(data: apods)
                    self.view?.apodList = apods
                }
                
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
