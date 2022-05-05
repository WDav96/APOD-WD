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
    var interactor = HomeInteractor()
    
    // MARK: - Initializers
    
    init(view: PresenterView) {
        self.view = view
    }
    
    // MARK: - Public Methods
    
    func getApods() {
        interactor.getLastsApods { [weak self] (result: Result<[Apod], Error>) in
            switch result {
            case .success(let apods):
                self?.view?.apodList = apods
            case .failure(let error):
                print(error)
            }
        }
    }
}
