//
//  AllViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class AllViewController: UIViewController {

    // MARK: - Properties
    private let allView = AllView()
    private let networkService = BaseNetworkService()
    private var allResponse: AllResponse? {
        didSet {
            allView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All"
        view = allView
        allView.setCollectionViewDelegate(self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Ebook, Music..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchAll()
    }
    
    private func fetchAll(with text: String = "All") {
        networkService.request(AllRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.allResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension AllViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let allDetailViewController = AllDetailViewController()
        allDetailViewController.all = allResponse?.results?[indexPath.row]
        navigationController?.pushViewController(allDetailViewController, animated: true)
    }
}

extension AllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AllCollectionViewCell
        let all = allResponse?.results?[indexPath.row]
        cell.title = all?.trackName
        cell.imageView.downloadImage(from: all?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

}

extension AllViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchAll(with: text)
        }
    }
}
