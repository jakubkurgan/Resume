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
        HttpClient().request(method: .get, path: "fake-resume") { result in
            switch result {
            case .success(let data):
                do {
                    completion(.success(try JSONHelper.decodeToObject(from: data)))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
