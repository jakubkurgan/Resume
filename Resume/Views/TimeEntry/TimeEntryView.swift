//
//  TimeEntryView.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct TimeEntryView: View {
    var entry: TimeEntry
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
            VStack(alignment: .leading) {
                Text(entry.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(entry.startDate.getFormattedTimePeriodAndRange(to: entry.endDate))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
}
