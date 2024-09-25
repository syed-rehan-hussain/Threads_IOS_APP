//
//  RegisterView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack{
                    TextField("Enter full name", text: $email)
                        .modifier(TextFieldModifier())
                    
                    TextField("Enter username", text: $email)
                        .modifier(TextFieldModifier())
                    
                    TextField("Enter email", text: $email)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Enter password", text: $password)
                        .modifier(TextFieldModifier())
                }
                .padding(.bottom)
                
                Button{
                    
                } label: {
                    Text("Register")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                Spacer()
                
                Divider()
                
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Button{
                        dismiss()
                    } label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
