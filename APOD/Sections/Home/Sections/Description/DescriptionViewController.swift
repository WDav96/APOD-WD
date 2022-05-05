//
//  DescriptionViewController.swift
//  APOD
//
//  Created by W.D. on 3/02/22.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var authorDateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Internal Properties
    
    var apod: Apod?
    var apodImage: UIImage?

    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Lifecycle ViewController
    
    private func setupView() {
        titleLabel.text = apod?.title
        if let image = apodImage {
            self.image.image = image
            self.image.setRounded()
        }
        authorDateLabel.text = "\(apod?.copyright ?? "Unknown") - \(apod?.date ?? "")"
        descriptionLabel.text = apod?.explanation
    }
    
}
