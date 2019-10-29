//
//  ProfileService.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct ProfileService {
    static func getProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        guard let url = URL(string: "https://gist.githubusercontent.com/jakubkurgan/c93e13915d1d620447dc6c380c504a46/raw/36ffa211437a1c37563af3856e8dba9d63fcf5df/fake-resume") else {
            return
        }
        HttpClient().request(path: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.dateOnly)
                    completion(.success(try decoder.decode(Profile.self, from: data)))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func getImage(imageUrl: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        HttpClient().request(path: url) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
