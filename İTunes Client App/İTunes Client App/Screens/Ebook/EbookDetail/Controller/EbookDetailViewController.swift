//
//  EbookDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit

class EbookDetailViewController: UIViewController {

    var ebook: Ebook? {
        didSet {
            title = ebook?.trackName
            ebookDetailView.imageView.downloadImage(from: ebook?.artworkLarge)
            ebookDetailView.releaseDate = ebook?.releaseDate
            ebookDetailView.artistName = ebook?.artistName
            ebookDetailView.country = ebook?.country
        }
    }
    
    private let ebookDetailView = EbookDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ebookDetailView
    }

}
