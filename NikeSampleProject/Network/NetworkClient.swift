//
//  NetworkClient.swift
//  NikeSampleProject
//
//  Created by David Rynn on 12/11/20.
//

import Foundation

protocol NetworkClientProtocol {
    func fetchData(completion: @escaping (Result<Data, NikeError>) -> Void)
}


final class NetworkClient: NetworkClientProtocol {
    /// Fetch data using data task
    /// - Parameter completion: Uses a result with data as success and NewsReader error for an error
    func fetchData(completion: @escaping (Result<Data, NikeError>) -> Void) {
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json") else {
            completion(.failure(.networkIssue("Invalid url")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NikeError.networkIssue("Unable to retreive data")))
            }
        }
        task.resume()
    }
    
}


/// Error type for entire app
/// case responseError for http response errors
/// case networkIssue for other network issues
/// case jsonError is for decoding errors
enum NikeError: Error {
    case responseError(_ code: Int)
    case networkIssue(_ error: String)
    case jsonError
    
    var localizedDescription: String {
        switch(self) {
        case .responseError(let code):
            return "Http response error: \(code)"
        case .networkIssue(let text):
            return "Network issue: \(text)"
        case .jsonError:
            return "Decoding error"
        }
    }
}
