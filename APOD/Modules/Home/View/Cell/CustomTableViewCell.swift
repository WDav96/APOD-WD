//
//  CustomCellTableViewCell.swift
//  APOD
//
//  Created by David Molina on 3/02/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
        
    // MARK: - IBOutlets
    
    @IBOutlet private weak var apodImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - Internal Properties
    
    var apod: Apod? {
        didSet {
            setupCell()
        }
    }
    
    var image: UIImage? {
        apodImageView.image
    }
    
    // MARK: - Private Properties
    
    private var imageService = ImageService()
    private var urlIdentifier: String = ""
    
    // MARK: - Private Methods
    
    private func setupCell() {
        titleLabel.text = apod?.title
        dateLabel.text = apod?.date
        let url = apod?.url ?? ""
        setupImage(url: url)
    }
    
    private func setupImage(url: String) {
        guard let url = URL(string: url) else { return }
            imageService.image(for: url) { image   in
                    self.apodImageView.image = image
                    self.apodImageView.setRounded()
        }
    }
    
}
    
    
