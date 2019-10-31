//
//  MainHeaderSectionView.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct MainHeaderSectionView: View {
    var imageData: Data?
    var fullName: String?
    var currentPosition: String?
    var description: String?
    
    
    var body: some View {
        Section() {
            MainHeaderView(imageData: imageData,
                            backgroufColor: .gray,
                            title: fullName ?? "",
                            headline: currentPosition ?? "",
                            subheadline: description ?? "")
        }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}
