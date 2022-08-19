//
//  BaseTokenStorage.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 19.08.2022.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
    // MARK: -Nested Types
    
    
    func getToken() throws -> TokenContainer {
        TokenContainer(
            token: "0641a14503410fd217160d73aa69a0e036b877f03646c1e758a7725436e5be78",
            recivingDate: Date()
        )
        // 595d9f58b8ac34689b1326e2cf4ef803882995c267a00ce34c6220f4a6d8ed6a in case of
    }
    
    func set(newToken: TokenContainer) throws { }
    
}

