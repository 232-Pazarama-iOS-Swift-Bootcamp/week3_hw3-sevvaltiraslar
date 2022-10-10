//
//  AllDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit

class AllDetailViewController: UIViewController {

    var all: All? {
        didSet {
            title = all?.trackName
            allDetailView.imageView.downloadImage(from: all?.artworkLarge)
            allDetailView.releaseDate = all?.releaseDate
            allDetailView.artistName = all?.artistName
            allDetailView.country = all?.country
        }
    }
    
    private let allDetailView = AllDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = allDetailView
    }

}
