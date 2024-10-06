//
//  CircularProfileImageView.swift
//  Threads_IOS_App
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxsmall
    case xsmall
    case small
    case medium
    case large
    case xlarge
    
    var dimension: CGFloat{
        switch self{
            case .xxsmall: return 28
            case .xsmall: return 32
            case .small: return 40
            case .medium: return 48
            case .large: return 64
            case .xlarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
   
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View{
        CircularProfileImageView(user: dev.user, size: .medium)
    }
}
