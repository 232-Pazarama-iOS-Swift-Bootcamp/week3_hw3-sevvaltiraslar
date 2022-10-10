//
//  NewDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit
import CoreData

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
        // Detaylar sayfasına buton eklendi.
        let starButton = UIButton(frame: CGRect(x: 30, y: 700, width: 30, height: 30))
        starButton.backgroundColor = .red
        starButton.setTitle("★", for: .normal)
        starButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        newDetailView.addSubview(starButton)
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
        
        let favoritesViewController = MovieFavoritesViewController()
        navigationController?.pushViewController(favoritesViewController, animated: true)
    }
}
