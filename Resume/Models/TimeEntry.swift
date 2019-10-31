//
//  TimeEntry.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct TimeEntry: Codable, Hashable {
    let name: String
    let startDate: Date
    let endDate: Date?
}
