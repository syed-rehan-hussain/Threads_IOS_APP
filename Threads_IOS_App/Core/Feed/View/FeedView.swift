//
//  FeedView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View{
        FeedView()
    }
}
