//
//  MusicVideoDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit

class MusicVideoDetailViewController: UIViewController {

    var musicVideo: MusicVideo? {
        didSet {
            title = musicVideo?.trackName
            musicVideoDetailView.imageView.downloadImage(from: musicVideo?.artworkLarge)
            musicVideoDetailView.releaseDate = musicVideo?.releaseDate
            musicVideoDetailView.artistName = musicVideo?.artistName
            musicVideoDetailView.country = musicVideo?.country
        }
    }
    
    private let musicVideoDetailView = MusicVideoDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = musicVideoDetailView
    }

}
