//
//  SoftwareDetailViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import UIKit
import CoreData

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
        
        // Detaylar sayfasına buton eklendi.
        let starButton = UIButton(frame: CGRect(x: 30, y: 700, width: 30, height: 30))
        starButton.backgroundColor = .red
        starButton.setTitle("★", for: .normal)
        starButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        softwareDetailView.addSubview(starButton)
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
        
        let favoritesViewController = SoftwareFavoritesViewController()
        navigationController?.pushViewController(favoritesViewController, animated: true)
    }

}
