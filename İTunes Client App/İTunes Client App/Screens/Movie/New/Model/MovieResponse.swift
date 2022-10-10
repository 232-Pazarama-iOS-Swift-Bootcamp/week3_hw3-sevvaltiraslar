//
//  MovieResponse.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import Foundation

struct MovieResponse: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}
