//
//  MusicFavoritesViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 10.10.2022.
//

import UIKit
import CoreData

class MusicFavoritesViewController: UIViewController {

    var nameArray = [String]()
    var idArray = [UUID]()
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    

    //CoreData'ya kaydedilen verileri çekme işlemi
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let name = result.value(forKey: "name") as? String {
                    self.nameArray.append(name) //Kaydedilen veri boş bir string dizisine ekleniyor.
                }
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                tableView.reloadData()
            }
        } catch {
            print("Error")
        }
    }

}

// MARK: - TableView DataSource ve Delegate Ayarı
extension MusicFavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
}
