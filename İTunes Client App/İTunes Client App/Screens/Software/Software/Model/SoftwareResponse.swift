//
//  SoftwareResponse.swift
//  İTunes Client App
//
//  Created by SEVVAL on 9.10.2022.
//

import Foundation

struct SoftwareResponse: Decodable {
    let resultCount: Int?
    let results: [Software]?
}
