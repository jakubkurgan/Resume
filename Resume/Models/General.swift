//
//  General.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct General: Codable {
    let firstName: String
    let lastName: String
    let currentPosition: String
    let description: String
    let photoUrl: String?
}
