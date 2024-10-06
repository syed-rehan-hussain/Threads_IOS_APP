//
//  EditProfileView.swift
//  Threads_IOS_App
//
//  Created by Mac on 28/09/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    @State private var link:String = ""
    @State private var bio:String = ""
    @State private var isPrivateProfile: Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel =  EditProfileViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                                 
                            Text(user.fullname)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        
                        TextField("Enter Your Bio...", text: $bio)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                             
                        TextField("Add link...", text: $link)
                    }
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done") {
                        Task{ try await viewModel.UpdateUserData() }
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View{
        EditProfileView(user: dev.user)
    }
}
