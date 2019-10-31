//
//  CircleModifier.swift
//  Resume
//
//  Created by Jakub Kurgan on 31/10/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import SwiftUI

struct CircleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}
extension View {
    func circled() -> some View {
        self.modifier(CircleModifier())
    }
}
