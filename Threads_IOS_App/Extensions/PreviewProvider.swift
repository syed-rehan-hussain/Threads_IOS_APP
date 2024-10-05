//
//  PreviewProvider.swift
//  Threads_IOS_App
//
//  Created by Mac on 02/10/2024.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, 
                    email: "max@gmail.com", fullname: "Max Verstappen",
                    username: "maxverstappen1")
}
