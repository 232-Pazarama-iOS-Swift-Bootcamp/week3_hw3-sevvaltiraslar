//
//  TvShow.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import Foundation

struct TvShow: Decodable {
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case country
    }
}
