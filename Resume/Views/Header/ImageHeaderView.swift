//
//  ImageHeaderView.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct ImageHeaderView: View {
    
    var imageData: Data?
    var backgroufColor: UIColor
    
    var body: some View {
        VStack(alignment: .leading) {
            Color(backgroufColor)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 150)

            CircleImage(imageData: imageData)
            .frame(width: 150, height: 150)
                .offset(x: 20, y: -100)
                .padding(.bottom, -120)
        }
    }
}
