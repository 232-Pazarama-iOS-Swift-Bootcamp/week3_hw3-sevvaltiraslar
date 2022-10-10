//
//  DetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 5.10.2022.
//

import Foundation
import UIKit
import CoreData

final class DetailViewController: UIViewController {
    
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.reduce("") { $1 + ", " + $0 }
        }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        
        // Detaylar sayfasına buton eklendi.
        let starButton = UIButton(frame: CGRect(x: 30, y: 700, width: 30, height: 30))
        starButton.backgroundColor = .red
        starButton.setTitle("★", for: .normal)
        starButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        detailView.addSubview(starButton)
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
        
        let favoritesViewController = FavoritesViewController()
        navigationController?.pushViewController(favoritesViewController, animated: true)
    }
    
}

/*

 addSubview(starButton)
 starButton.setTitle("Yıldız", for: .normal)
 starButton.tintColor = .red
 starButton.translatesAutoresizingMaskIntoConstraints = false
 NSLayoutConstraint.activate([
     starButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
     starButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
     starButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
 ])
 */
