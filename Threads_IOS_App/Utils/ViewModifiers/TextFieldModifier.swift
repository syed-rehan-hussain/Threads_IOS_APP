//
//  TextFieldModifier.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier{
    func body(content:Content) -> some View{
        content
            .font(.subheadline)
            .padding(12)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
