//
//  TokenContainer.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 19.08.2022.
//

import Foundation

struct TokenContainer {
    
    let token: String
    let recivingDate: Date
    
    var tokenExpiringTime: TimeInterval {
        39600
    }
    
    var isExpired: Bool {
        let now = Date()
        if recivingDate.addingTimeInterval(tokenExpiringTime) > now {
            return false } else {
                return true
            }
    }
    
}
