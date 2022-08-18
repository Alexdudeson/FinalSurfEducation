//
//  AuthService.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 18.08.2022.
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask<AuthRequestModel, AuthResponseModel>(method: .post, path: "auth/login")
    
    func performLoginRequest(
    credentials: AuthRequestModel,
    _ onResponseWasReceived: @escaping (_ result: Result<AuthResponseModel, Error>) -> Void
    ) {
        dataTask.performRequest(input: credentials, onResponseWasReceived)
    }
}
