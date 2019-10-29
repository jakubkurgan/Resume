//
//  ProfileViewModel.swift
//  Resume
//
//  Created by Jakub Kurgan on 29/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    
    let didChange = PassthroughSubject<ProfileViewModel,Never>()
    
    init() {
        fetchProfile()
    }
    
    var imageData: Data? {
        didSet {
            didChange.send(self)
        }
    }
    
    var profile: Profile? {
        didSet {
            didChange.send(self)
            fetchImage()
        }
    }
    
    private func fetchProfile() {
        ProfileService.getProfile { [weak self] (result) in
            switch result {
            case .failure(_): break
            case .success(let profile):
                self?.profile = profile
            }
        }
    }
    
    private func fetchImage() {
        guard let imageUrl = profile?.general.photoUrl else {
            return
        }
        ProfileService.getImage(imageUrl: imageUrl) { [weak self] (result) in
           switch result {
            case .failure(_): break
            case .success(let data):
                self?.imageData = data
            }
        }
    }
}
