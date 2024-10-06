//
//  CreateThreadView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = ThreadViewModel()
    @State private var caption: String = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading){
                        Text(user?.username ?? "")
                        
                        //TextEditor(text: $caption)
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $caption)
                                .background(.clear)
                            
                            if caption.isEmpty {
                                Text("Start a thread..")
                                    .font(.subheadline)
                                    .padding(.top, 8)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Spacer()
                    if !caption.isEmpty{
                        Button{
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Post"){
                        Task {
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.09)
                    .disabled(caption.isEmpty)
                    .font(.headline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}


struct CreateThreadView_Previews: PreviewProvider {
    static var previews: some View{
        CreateThreadView()
    }
}
