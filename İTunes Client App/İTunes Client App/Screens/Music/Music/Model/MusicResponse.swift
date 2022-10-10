//
//  MusicResponse.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import Foundation

struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}
