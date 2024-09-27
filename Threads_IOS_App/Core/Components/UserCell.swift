//
//  UserCell.swift
//  Threads_IOS_App
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(alignment:.center, spacing: 12){
            CircularProfileImageView()
            
            VStack(alignment: .leading, spacing: 0){
                Text("david.metzger")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("David Metzger")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                
            }
            Spacer()
            Button{
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .foregroundColor(.black)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
