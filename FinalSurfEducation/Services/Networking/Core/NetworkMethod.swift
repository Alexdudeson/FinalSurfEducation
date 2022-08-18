//
//  NetworkMethod.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 17.08.2022.
//

import Foundation


enum NetworkMethod: String {
    case get
    case post
    
}

extension NetworkMethod {
    
    var method: String {
        rawValue.uppercased()
    }
}

