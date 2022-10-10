//
//  ShortFilmRequest.swift
//  İTunes Client App
//
//  Created by SEVVAL on 8.10.2022.
//

import Foundation

/*struct ShortFilmRequest: DataRequest {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "shortFilm"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String = "Short Film") {
        self.searchText = searchText
    }
    
    func decode(_ data: Data) throws -> ShortFilmResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(ShortFilmResponse.self, from: data)
        return response
    }
}
*/
