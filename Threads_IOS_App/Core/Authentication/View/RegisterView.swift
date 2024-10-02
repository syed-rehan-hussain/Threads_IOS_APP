//
//  RegisterView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegistrationViewModel()

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
                    TextField("Enter full name", text: $viewModel.name)
                        .modifier(TextFieldModifier())
                    
                    TextField("Enter username", text: $viewModel.username)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    TextField("Enter email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Enter password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                }
                .padding(.bottom)
                
                Button{
                    Task { try await viewModel.createUser() }
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
