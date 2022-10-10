//
//  MusicVideoRequest.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import Foundation

struct MusicVideoRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "musicVideo"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "Music Video") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> MusicVideoResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(MusicVideoResponse.self, from: data)
        return response
    }
}
