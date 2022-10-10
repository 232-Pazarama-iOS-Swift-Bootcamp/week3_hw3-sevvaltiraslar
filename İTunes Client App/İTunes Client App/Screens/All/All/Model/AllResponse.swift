//
//  AllResponse.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import Foundation

struct AllResponse: Decodable {
    let resultCount: Int?
    let results: [All]?
}
