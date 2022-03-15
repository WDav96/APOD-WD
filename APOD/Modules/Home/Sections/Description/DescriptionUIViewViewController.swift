//
//  DescriptionUIViewViewController.swift
//  APOD
//
//  Created by W.D. on 3/02/22.
//

import UIKit

class DescriptionUIViewViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Internal Properties
    
    var apod: Apod?
    var apodImage: UIImage?

    // MARK: - Lifecycle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = apod?.title
        if let image = apodImage {
            self.image.image = image
        }
        authorDateLabel.text = "\(apod?.copyright ?? "") - \(apod?.date ?? "")"
        descriptionLabel.text = apod?.explanation
    }
}
