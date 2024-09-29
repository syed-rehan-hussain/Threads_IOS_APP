//
//  EditProfileView.swift
//  Threads_IOS_App
//
//  Created by Mac on 28/09/2024.
//

import SwiftUI

struct EditProfileView: View {
    @State private var link:String = ""
    @State private var bio:String = ""
    @State private var isPrivateProfile: Bool = false
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
                                 
                            Text("David Metzger")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
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
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done") {
                        
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
