//
//  MusicVideoViewController.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import UIKit

class MusicVideoViewController: UIViewController {

    // MARK: - Properties
    private let musicVideoView = MusicVideoView()
    private let networkService = BaseNetworkService()
    private var musicVideoResponse: MusicVideoResponse? {
        didSet {
            musicVideoView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music Video"
        view = musicVideoView
        musicVideoView.setCollectionViewDelegate(self, andDataSource: self)
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "R&B, Hip-Hop..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        fetchMusicVideo()
    }
    
    private func fetchMusicVideo(with text: String = "Music Video") {
        networkService.request(MusicVideoRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.musicVideoResponse = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension MusicVideoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let musicVideoDetailViewController = MusicVideoDetailViewController()
        musicVideoDetailViewController.musicVideo = musicVideoResponse?.results?[indexPath.row]
        navigationController?.pushViewController(musicVideoDetailViewController, animated: true)
    }
}

extension MusicVideoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        musicVideoResponse?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicVideoCollectionViewCell
        let musicVideo = musicVideoResponse?.results?[indexPath.row]
        cell.title = musicVideo?.trackName
        cell.imageView.downloadImage(from: musicVideo?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

}

extension MusicVideoViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMusicVideo(with: text)
        }
    }
}
