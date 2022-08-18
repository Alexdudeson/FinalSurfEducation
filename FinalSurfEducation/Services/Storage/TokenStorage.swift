//
//  TokenStorage.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 19.08.2022.
//

import Foundation

protocol TokenStorage{
    
    func getToken() throws -> TokenContainer
    func set(newToken: TokenContainer) throws
    
}
