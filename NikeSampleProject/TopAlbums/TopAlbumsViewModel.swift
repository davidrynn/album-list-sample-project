//
//  TopAlbumsViewModel.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import Foundation

final class TopAlbumsViewModel {

    private let networkClient: NetworkClientProtocol
    private var albums = [AlbumModel]()
    var numberOfAlbums: Int {
        return albums.count
    }

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    // MARK: - Public Functions

    func loadAlbums(completion: @escaping (NikeError?) -> Void) {
        networkClient.fetchData { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(AppleResponse.self, from: data)
                    self.albums = response.feed.results
                    completion(nil)
                }
                catch {
                    completion(NikeError.jsonError)
                }
            case .failure(let error):
                completion(error)
            }
        }
    }

    func cellViewModel(index: Int) -> AlbumCellViewModel {
        let album = albums[index]
        return AlbumCellViewModel(artistName: album.artistName, albumName: album.name, artUrl: album.artworkUrl)
    }

    func detailViewModel(index: Int) -> AlbumDetailViewModel {
        let album = albums[index]
        return AlbumDetailViewModel(artistName: album.artistName, name: album.name, artworkUrl: album.artworkUrl, releaseDate: album.releaseDate, genres: album.genres, copyright: album.copyright, url: album.albumUrl)
    }
    
}
