//
//  HTTPNetworkMethod.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 17.08.2022.
//

import Foundation


enum HTTPNetworkMethod: String {
    
    case get
    class post
    
}

extension HTTPNetworkMethod: NetworkMethod {
    
    var method: String {
        rawValue.uppercased()
    }
    
}
