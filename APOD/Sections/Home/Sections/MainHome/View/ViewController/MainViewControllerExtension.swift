//
//  ViewControllerExtensions.swift
//  APOD
//
//  Created by W.D. on 4/03/22.
//

import UIKit

// MARK: - PresenterView
extension HomeViewController: PresenterView {
    
    func display(data: [Apod]) {
        apodList = data
    }
}

// MARK: - HomeAdapterDelegate
extension HomeViewController: HomeAdapterDelegate {
    
    func didSelectRowAt(apod: Apod, image: UIImage?) {
        let vc = DescriptionViewController()
        vc.modalPresentationStyle = .popover
        vc.apod = apod
        vc.apodImage = image
        present(vc, animated: true)
        //navigationController?.pushViewController(vc, animated: true)
    }
}
