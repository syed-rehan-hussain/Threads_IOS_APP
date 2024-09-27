//
//  ProfileThreadFilter.swift
//  Threads_IOS_App
//
//  Created by Mac on 27/09/2024.
//

import Foundation


enum ProfileThreadFilter:Int, CaseIterable, Identifiable{
    case threads
    case replies
    
    var title: String{
        switch self{
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
