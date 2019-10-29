//
//  Profile.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let general: General
    let experiences: [Experience]
    let educations: [Education]
    let skills: [Skill]
}
