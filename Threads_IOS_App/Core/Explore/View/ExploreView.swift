//
//  ExploreView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                LazyVStack {
                    ForEach(1...10, id: \.self) { count in
                        VStack{
                            UserCell()
                            
                            Divider()
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
