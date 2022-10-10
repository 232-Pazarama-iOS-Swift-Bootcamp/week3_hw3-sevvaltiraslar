//
//  TvShowResponse.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import Foundation

struct TvShowResponse: Decodable {
    let resultCount: Int?
    let results: [TvShow]?
}
