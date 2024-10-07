//
//  TimeStamp.swift
//  Threads_IOS_App
//
//  Created by Mac on 06/10/2024.
//

import Foundation
import Firebase

extension Timestamp {
    func timeStampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
