//
//  TimeMainEntryView.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct TimeMainEntryView: View {
    var title: String
    var startDate: Date
    var endDate: Date?
    var entries: [TimeEntry]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            Text(startDate.getFormattedTimePeriod(to: endDate))
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(entries, id: \.self) { entry in
                TimeEntryView(entry: entry)
            }
        }
    }
}

