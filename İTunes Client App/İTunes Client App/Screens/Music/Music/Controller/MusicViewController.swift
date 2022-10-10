//
//  MusicViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class MusicViewController: UIViewController {

    // MARK: - Properties
    private let musicView = MusicView()
    private let networkService = BaseNetworkService()
    private var musicResponse: MusicResponse? {
        didSet {
            musicView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"
        view = musicView
        musicView.setCollectionViewDelegate(self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "R&B, Hip-Hop..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchMusic()
    }
    
    private func fetchMusic(with text: String = "Music") {
        networkService.request(MusicRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.musicResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension MusicViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let musicDetailViewController = MusicDetailViewController()
        musicDetailViewController.music = musicResponse?.results?[indexPath.row]
        navigationController?.pushViewController(musicDetailViewController, animated: true)
    }
}

extension MusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        musicResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicCollectionViewCell
        let music = musicResponse?.results?[indexPath.row]
        cell.title = music?.trackName
        cell.imageView.downloadImage(from: music?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

}

extension MusicViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMusic(with: text)
        }
    }
}
