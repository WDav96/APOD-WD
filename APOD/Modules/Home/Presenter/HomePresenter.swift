//
//  MainPresenter.swift
//  APOD
//
//  Created David Molina on 4/03/22.
//

import Foundation

protocol PresentData: AnyObject {
    var apodList: [Apod] { get set }
    func display(data: [Apod])
}

class HomePresenter {
    
    // MARK: - Internal Properties

    weak var presentView: PresentData?
    
    var repository = HomeRepository()
    
    // MARK: - Initializers
    
    init(view: PresentData) {
        self.presentView = view
    }
    
    // MARK: - Public Methods
    
    func getApods() {
        repository.getLastsApods { [weak self] (result: Result<[Apod], Error>) in
            switch result {
            case .success(let apods):
                self?.presentView?.apodList = apods
            case .failure(let error):
                print(error)
            }
        }
    }
}
