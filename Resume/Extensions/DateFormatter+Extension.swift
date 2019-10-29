//
//  DateFormatter+Extension.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var dateOnly: DateFormatter {
        let formater = DateFormatter()
        formater.dateFormat = "dd-MM-yyyy"
        return formater
    }
}
