//
//  ContentView.swift
//  Threads_IOS_App
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                ThreadsTabBar()
            }else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
