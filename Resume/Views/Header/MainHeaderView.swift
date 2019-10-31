//
//  MainHeaderView.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct MainHeaderView: View {
    
    var imageData: Data?
    var backgroufColor: UIColor
    var title: String
    var headline: String
    var subheadline: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageHeaderView(imageData: imageData,
                       backgroufColor: backgroufColor)
            Spacer()
            PersonalDetailsView(title: title,
                                headline: headline,
                                subheadline: subheadline)
            
        }
    }
}
