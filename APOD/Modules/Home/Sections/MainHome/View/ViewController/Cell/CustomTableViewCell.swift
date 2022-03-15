//
//  CustomCellTableViewCell.swift
//  APOD
//
//  reated by W.D. on 3/02/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
        
    // MARK: - IBOutlets
    
    @IBOutlet private weak var imageOfDay: UIImageView!
    @IBOutlet private weak var titleImage: UILabel!
    @IBOutlet private weak var dateImage: UILabel!
    
    // MARK: - Internal Properties
    
    var apod: Apod? {
        didSet {
            setupApod()
        }
    }
    
    var image: UIImage? {
        imageOfDay.image
    }
    
    // MARK: - Private Properties
    
    private var imageService = ImageService()
    private var representedIdentifier: String = ""
    
    // MARK: - Private Methods
    
    private func setupApod() {
        let representedIdentifier = apod?.url ?? ""
        self.representedIdentifier = representedIdentifier
        titleImage.text = apod?.title
        dateImage.text = apod?.date
        setupImage()
    }
    
    private func setupImage() {
        let representedIdentifier = apod?.url ?? ""
        if let url = URL(string: apod?.url ?? "") {
            imageService.image(for: url) { image   in
                if (self.representedIdentifier == representedIdentifier) {
                    self.imageOfDay.image = image
                }
            }
        }
    }
    
}
    
    
