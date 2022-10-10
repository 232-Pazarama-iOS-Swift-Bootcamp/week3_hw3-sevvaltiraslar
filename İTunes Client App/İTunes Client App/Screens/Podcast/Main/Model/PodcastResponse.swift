//
//  PodcastResponse.swift
//  İTunes Client App
//
//  Created by SEVVAL on 4.10.2022.
//

import Foundation

struct PodcastResponse: Decodable {
    let resultCount: Int?
    let results: [Podcast]?
}
