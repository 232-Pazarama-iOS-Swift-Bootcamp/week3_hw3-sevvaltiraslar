//
//  TvShowRequest.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import Foundation

struct TvShowRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "tvShow"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "Tv Show") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> TvShowResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(TvShowResponse.self, from: data)
        return response
    }
}
