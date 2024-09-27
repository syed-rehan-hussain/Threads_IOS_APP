//
//  ThreadCell.swift
//  Threads_IOS_App
//
//  Created by Mac on 26/09/2024.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.top, spacing: 12){
                CircularProfileImageView()
                
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text("David Metzger")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text("Ferrari Driver in Formula 1")
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

#Preview {
    ThreadCell()
}
