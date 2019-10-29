//
//  ProfileView.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel = ProfileViewModel()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        
        VStack {
            Text(viewModel.profile?.general.firstName ?? "")
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
        }.onReceive(viewModel.didChange) { (viewModel) in
            guard let imageData =  viewModel.imageData,
                  let image = UIImage(data: imageData) else {
                return
            }
            self.image = image
        }
        
    }
}
