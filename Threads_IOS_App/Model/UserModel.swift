//
//  UserModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 30/09/2024.
//

import Foundation


struct User: Identifiable, Codable{
    let id: String
    let email: String
    let fullname: String
    let username: String
    var bio: String?
    var profilepic:String?
}
