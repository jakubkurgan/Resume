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
        List() {
            MainHeaderSectionView(imageData: viewModel.profile?.general.imageData,
                                  fullName: viewModel.profile?.general.fullName,
                                  currentPosition: viewModel.profile?.general.currentPosition,
                                  description: viewModel.profile?.general.description)
            
            Section(header: Text("experience")) {
                ForEach(viewModel.profile?.experiences ?? [], id: \.self) { exp in
                    TimeMainEntryView(title: exp.name, startDate: exp.startDate, endDate: exp.endDate, entries: exp.roles)
                }
            }
            
            Section(header: Text("education")) {
                ForEach(viewModel.profile?.educations ?? [], id: \.self) { exp in
                    TimeMainEntryView(title: exp.name, startDate: exp.startDate, endDate: exp.endDate, entries: exp.subjects)
                }
            }
            
            Section(header: Text("skills")) {
                ForEach(viewModel.profile?.skills ?? [], id: \.self) { skill in
                    Text(skill.name)
                        .font(.subheadline)
                }
            }
        }.blur(radius: viewModel.profile != nil ? 0 : 5)
        .edgesIgnoringSafeArea(.top)
            .alert(isPresented: $viewModel.displayAlert) {
                Alert(title: Text("alertTitle"), message: Text(viewModel.error?.localizedDescription ?? ""), dismissButton: .default(Text("alertRetry")) {
                    self.viewModel.fetchProfile()
                })
            }
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = .gray
                self.viewModel.fetchProfile()
            })
    }
}
