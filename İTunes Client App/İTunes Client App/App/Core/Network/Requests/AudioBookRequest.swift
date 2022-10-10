//
//  AudioBookRequest.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import Foundation

/*struct AudioBookRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "audioBook"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "Audio Book") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> AudioBookResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(AudioBookResponse.self, from: data)
        return response
    }
}*/
