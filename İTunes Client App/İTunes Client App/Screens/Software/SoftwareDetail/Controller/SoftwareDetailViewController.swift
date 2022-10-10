//
//  SoftwareDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit

class SoftwareDetailViewController: UIViewController {

    var software: Software? {
        didSet {
            title = software?.trackName
            softwareDetailView.imageView.downloadImage(from: software?.artworkLarge)
            softwareDetailView.releaseDate = software?.releaseDate
            softwareDetailView.artistName = software?.artistName
            softwareDetailView.country = software?.country
        }
    }
    
    private let softwareDetailView = SoftwareDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = softwareDetailView
    }

}
