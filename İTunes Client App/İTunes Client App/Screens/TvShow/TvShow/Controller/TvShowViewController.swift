//
//  TvShowViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class TvShowViewController: UIViewController {

    // MARK: - Properties
    private let tvShowView = TvShowView()
    private let networkService = BaseNetworkService()
    private var tvShowResponse: TvShowResponse? {
        didSet {
            tvShowView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tv Show"
        view = tvShowView
        tvShowView.setCollectionViewDelegate(self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Talk Show, Series..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchTvShow()
    }
    
    private func fetchTvShow(with text: String = "Tv Show") {
        networkService.request(TvShowRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.tvShowResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension TvShowViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tvShowDetailViewController = TvShowDetailViewController()
        tvShowDetailViewController.tvShow = tvShowResponse?.results?[indexPath.row]
        navigationController?.pushViewController(tvShowDetailViewController, animated: true)
    }
}

extension TvShowViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tvShowResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TvShowCollectionViewCell
        let tvShow = tvShowResponse?.results?[indexPath.row]
        cell.title = tvShow?.trackName
        cell.imageView.downloadImage(from: tvShow?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

}

extension TvShowViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchTvShow(with: text)
        }
    }
}
