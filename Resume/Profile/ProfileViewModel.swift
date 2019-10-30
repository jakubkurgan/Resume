//
//  ProfileViewModel.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Combine
import SwiftUI
import Foundation

class ProfileViewModel: ObservableObject {    
    @Published  var profile: Profile?
    
    func fetchProfile() {
        ProfileService.getProfile { [weak self] (result) in
            switch result {
            case .failure(_): break
            case .success(let profile):
                self?.profile = profile
            }
        }
    }
}

