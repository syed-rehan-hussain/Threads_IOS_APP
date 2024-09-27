//
//  FeedView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(1 ... 10, id: \.self) { count in
                        ThreadCell()
                    }
                }
            }
            
            .refreshable {
                print("Debug: Refresh Threads")
            }
            
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                    }
                }
            }
        }
        
    }
}

#Preview {
        FeedView()
}
