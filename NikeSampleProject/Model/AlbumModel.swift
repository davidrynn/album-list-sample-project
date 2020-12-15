//
//  AlbumModel.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import Foundation

struct AlbumModel: Decodable {
    var artistName: String
    var name: String
    var artworkUrl: String
    var releaseDate: String
    var genres: [Genre]
    var copyright: String
    var albumUrl: String
    var genresText: String {
        var genreArray = [String]()
        genres.forEach { genre in
            genreArray.append(genre.name)
        }
        return genreArray.joined(separator: ", ")
    }
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case name
        case genres
        case artworkUrl = "artworkUrl100"
        case copyright
        case albumUrl = "url"
    }
    
}

// Structs used to decode the base model.  Not used elsewhere
struct Feed: Decodable {
    var results: [AlbumModel]
}

struct AppleResponse: Decodable {
    var feed: Feed
}

struct Genre: Decodable {
    var name: String
}
