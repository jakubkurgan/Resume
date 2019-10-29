//
//  JSONHelper.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct JSONHelper {
    static func decodeToObject<R: Decodable>(from data: Data) throws -> R {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject)
        let decoder = JSONDecoder()
        let remote = try jsonData.decoded(using: decoder) as R
        
        return remote
    }
}
