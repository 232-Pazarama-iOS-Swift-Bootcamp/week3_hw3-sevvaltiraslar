//
//  SoftwareViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class SoftwareViewController: UIViewController {

    // MARK: - Properties
    private let softwareView = SoftwareView()
    private let networkService = BaseNetworkService()
    private var softwareResponse: SoftwareResponse? {
        didSet {
            softwareView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Software"
        view = softwareView
        softwareView.setCollectionViewDelegate(self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Advanture, Trainer..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchSoftware()
    }
    
    private func fetchSoftware(with text: String = "Software") {
        networkService.request(SoftwareRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.softwareResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension SoftwareViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let softwareDetailViewController = SoftwareDetailViewController()
        softwareDetailViewController.software = softwareResponse?.results?[indexPath.row]
        navigationController?.pushViewController(softwareDetailViewController, animated: true)
    }
}

extension SoftwareViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        softwareResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SoftwareCollectionViewCell
        let software = softwareResponse?.results?[indexPath.row]
        cell.title = software?.trackName
        cell.imageView.downloadImage(from: software?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

}

extension SoftwareViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchSoftware(with: text)
        }
    }
}
