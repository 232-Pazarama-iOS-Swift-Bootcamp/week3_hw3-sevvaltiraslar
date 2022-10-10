//
//  AllRequest.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import Foundation

struct AllRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "all"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "All") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> AllResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(AllResponse.self, from: data)
        return response
    }
}
