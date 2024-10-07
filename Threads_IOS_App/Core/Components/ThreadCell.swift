//
//  ThreadCell.swift
//  Threads_IOS_App
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI

struct ThreadCell: View {
    let thread: ThreadModel
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.top, spacing: 12){
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(thread.timestamp.timeStampString())
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16){
                        Button{
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            
            Divider()
        }
        .foregroundColor(.black)
        .padding()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View{
        ThreadCell(thread: dev.thread)
    }
}
