//
//  LoginView.swift
//  ThreadsApp
//
//  Created by Mac on 25/09/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
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
                    TextField("Enter Email", text: $email)
                        .modifier(TextFieldModifier())
                    
                    
                    SecureField("Enter Password", text: $password)
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
