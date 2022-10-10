//
//  TvShowDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit
import CoreData

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
        
        // Detaylar sayfasına buton eklendi.
        let starButton = UIButton(frame: CGRect(x: 30, y: 700, width: 30, height: 30))
        starButton.backgroundColor = .red
        starButton.setTitle("★", for: .normal)
        starButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        tvShowDetailView.addSubview(starButton)
    }
    
    //Bu fonksiyon ile favori butonuna basılırsa coreData'ya içinde bulunduğu detay sayfasının title ekleniyor ve favoriler sayfasına yönlendiriliyor.
    @objc private func addFavorite() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
         let favori = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: context)
         
        favori.setValue(title, forKey: "name")
        favori.setValue(UUID(), forKey: "id")
         do {
             try context.save()
         } catch {
             print("Error")
         }
        
        let favoritesViewController = TvShowFavoritesViewController()
        navigationController?.pushViewController(favoritesViewController, animated: true)
    }

}
