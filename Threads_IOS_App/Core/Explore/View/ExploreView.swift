//
//  ExploreView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(destination: OtherProfileView(user: user)) {
                            VStack{
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 6)
                        }
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
