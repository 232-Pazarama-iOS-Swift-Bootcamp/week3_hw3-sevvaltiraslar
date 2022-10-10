//
//  TvShowDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit

class TvShowDetailViewController: UIViewController {

    var tvShow: TvShow? {
        didSet {
            title = tvShow?.trackName
            tvShowDetailView.imageView.downloadImage(from: tvShow?.artworkLarge)
            tvShowDetailView.releaseDate = tvShow?.releaseDate
            tvShowDetailView.artistName = tvShow?.artistName
            tvShowDetailView.country = tvShow?.country
        }
    }
    
    private let tvShowDetailView = TvShowDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = tvShowDetailView
    }

}
