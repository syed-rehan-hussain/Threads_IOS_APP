//
//  LoginView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
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
                    TextField("Enter Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    
                    SecureField("Enter Password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                }
                
                NavigationLink{
                    Text("Forgot Password")
                } label:  {
                    Text("Forgot Password")
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button{
                    Task{ try await viewModel.loginUser() }
                } label: {
                    Text("Login")
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
                    Text("Dont't have an account?")
                    NavigationLink{
                        RegisterView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Register")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
