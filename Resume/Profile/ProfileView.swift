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
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(imageData: viewModel.profile?.general.imageData, backgroufColor: .gray)

            VStack(alignment: .leading) {
                Text(viewModel.profile?.general.fullName ?? "")
                    .font(.title)
                Text(viewModel.profile?.general.currentPosition ?? "")
                    .padding(.bottom)
                    .font(.headline)
                Text(viewModel.profile?.general.description ?? "")
                    .font(.subheadline)
            }
            .padding()
            Spacer()
        }.onAppear(perform: {
            self.viewModel.fetchProfile()
        })
    }
}


struct HeaderView: View {
    
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
        .clipShape(Circle())
        .overlay(
        Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

