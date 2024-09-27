//
//  CircularProfileImageView.swift
//  Threads_IOS_App
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image(.davidMetzger)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
