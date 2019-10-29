//
//  HttpClient.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "get"
    case post = "post"
    case put = "put"
    case patch = "patch"
}

enum HttpClientError: Error {
    case invalidURL
    case noData
}

extension HttpClientError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "invalidUrlErrorMessage"
        case .noData:
            return "noDataErrorMesssage"
        }
    }
}

struct HttpClient {
    
    private let session = URLSession.shared
    private let baseURL = URL(string: "https://gist.githubusercontent.com/jakubkurgan/c93e13915d1d620447dc6c380c504a46/raw/008d4efa9fd9746f1981921500b72821d3b47a34/")
    
    func request(method: HttpMethod, path: String, _ completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = baseURL?.appendingPathComponent(path) else {
            completion(.failure(HttpClientError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(HttpClientError.noData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
