//
//  ViewControllerExtensions.swift
//  APOD
//
//  Created by David Molina on 4/03/22.
//

import UIKit

// MARK: - PresentView
extension HomeViewController: PresentData {
    
    func display(data: [Apod]) {
        apodList = data
    }
}

// MARK: - HomeAdapterDelegate
extension HomeViewController: HomeAdapterDelegate {
    
    func didTapRow(apod: Apod, image: UIImage?) {
        let viewController = DescriptionViewController()
        viewController.modalPresentationStyle = .popover
        viewController.apod = apod
        viewController.apodImage = image
        present(viewController, animated: true)
        //navigationController?.pushViewController(vc, animated: true)
    }
}
