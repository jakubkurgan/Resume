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
        let path = "c93e13915d1d620447dc6c380c504a46/raw/148b684fbc32b79568f1a61fb65a57415f9e2879/fake-resume"
        HttpClient().request(path: path) { result in
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
}
