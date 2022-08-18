//
//  BaseTokenStorage.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 19.08.2022.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
    func getToken() throws -> TokenContainer {
        TokenContainer(token: "d6411b00f780eeb0ebf30b1734925a4cb83aff7e6b03bddedba121ce5902933d")
    }
    
    func set(newToken: TokenContainer) throws { }
    
}

