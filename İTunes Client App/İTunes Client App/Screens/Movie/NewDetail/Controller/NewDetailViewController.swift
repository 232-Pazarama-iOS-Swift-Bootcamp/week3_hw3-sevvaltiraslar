//
//  NewDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class NewDetailViewController: UIViewController {

    var movie: Movie? {
        didSet {
            title = movie?.trackName
            newDetailView.imageView.downloadImage(from: movie?.artworkLarge)
            newDetailView.releaseDate = movie?.releaseDate
            newDetailView.artistName = movie?.artistName
            newDetailView.country = movie?.country
        }
    }
    
    private let newDetailView = NewDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newDetailView
    }

}
