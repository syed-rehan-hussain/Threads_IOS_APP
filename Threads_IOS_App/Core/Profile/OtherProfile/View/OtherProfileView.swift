//
//  OtherProfileView.swift
//  Threads_IOS_App
//
//  Created by Mac on 02/10/2024.
//

import SwiftUI

struct OtherProfileView: View {
    let user:User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 5) {
                ProfileHeaderView(user: user)
                
                Button{
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                UserContentListView()
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OtherProfileView_Previews: PreviewProvider {
    static var previews: some View{
        OtherProfileView(user: dev.user)
    }
}
