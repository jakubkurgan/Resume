//
//  CircleImage.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var imageData: Data?
    
    var image: UIImage {
        if let imageData = imageData, let image = UIImage(data: imageData) {
            return  image
        } else {
            return UIImage()
        }
    }
    
    var body: some View {
        Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .circled()
    }
}
