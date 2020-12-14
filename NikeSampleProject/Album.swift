//
//  Album.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import Foundation

struct Album: Decodable {
    var artistName: String
    var name: String
    var artworkUrl: String
    var releaseDate: String
    var genres: [Genre]
    var copyright: String
    var url: String

    enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case name
        case genres
        case artworkUrl = "artworkUrl100"
        case copyright
        case url
    }

}

struct Feed: Decodable {
    var results: [Album]
}

struct AppleResponse: Decodable {
    var feed: Feed
}

struct Genre: Decodable {
    var name: String
}
/*
 "artistName": "Bad Bunny",
      "id": "1542102907",
      "releaseDate": "2020-11-27",
      "name": "EL ÚLTIMO TOUR DEL MUNDO",
      "kind": "album",
      "copyright": "℗ 2020 Rimas Entertainment LLC",
      "artistId": "1126808565",
      "contentAdvisoryRating": "Explicit",
      "artistUrl": "https://music.apple.com/us/artist/bad-bunny/1126808565?app=music",
      "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Music124/v4/41/a9/54/41a95462-a082-0046-1594-3f721b7b0ea3/195497640560.jpg/200x200bb.png",
      "genres": [
        {
          "genreId": "1119",
          "name": "Urbano latino",
          "url": "https://itunes.apple.com/us/genre/id1119"
        },
        {
          "genreId": "34",
          "name": "Music",
          "url": "https://itunes.apple.com/us/genre/id34"
        },
        {
          "genreId": "12",
          "name": "Latin",
          "url": "https://itunes.apple.com/us/genre/id12"
        }
      ],
      "url": "https://music.apple.com/us/album/el-%C3%BAltimo-tour-del-mundo/1542102907?app=music"

 */

/*
 Each cell should display the
name of the album, the artist, and the album art (thumbnail image). Tapping on a cell should push
another view controller onto the navigation stack where we see a larger image at the top of the screen
and the same information that was shown on the cell, plus genre, release date, and copyright info below
the image.

 */
