//
//  PersonalDetailsView.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct PersonalDetailsView: View {
    
    var title: String
    var headline: String
    var subheadline: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            Text(headline)
                .padding(.bottom)
                .font(.headline)
            Text(subheadline)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
    }
}
