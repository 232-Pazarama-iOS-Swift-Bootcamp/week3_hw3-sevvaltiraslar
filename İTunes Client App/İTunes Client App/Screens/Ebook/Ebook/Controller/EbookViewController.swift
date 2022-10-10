//
//  EbookViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class EbookViewController: UIViewController {

    // MARK: - Properties
    private let ebookView = EbookView()
    private let networkService = BaseNetworkService()
    private var ebookResponse: EbookResponse? {
        didSet {
            ebookView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ebook"
        view = ebookView
        ebookView.setCollectionViewDelegate(self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Noval, Story..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchEbook()
    }
    
    private func fetchEbook(with text: String = "Ebook") {
        networkService.request(EbookRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.ebookResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension EbookViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ebookDetailViewController = EbookDetailViewController()
        ebookDetailViewController.ebook = ebookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(ebookDetailViewController, animated: true)
    }
}

extension EbookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ebookResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EbookCollectionViewCell
        let ebook = ebookResponse?.results?[indexPath.row]
        cell.title = ebook?.trackName
        cell.imageView.downloadImage(from: ebook?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

}

extension EbookViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchEbook(with: text)
        }
    }
}
