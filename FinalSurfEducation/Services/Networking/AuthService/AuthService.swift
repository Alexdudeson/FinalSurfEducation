//
//  AuthService.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 18.08.2022.
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask<AuthRequestModel, AuthResponseModel>(
        inNeedInjectToken: false,
        method: .post, path: "auth/login")
    
    func performLoginRequestAndSaveToken(
    credentials: AuthRequestModel,
    _ onResponseWasReceived: @escaping (_ result: Result<AuthResponseModel, Error>) -> Void
    ) {
        dataTask.performRequest(input: credentials) { result in
            if case let .success(responseModel) = result {
                if #available(iOS 15, *) {
                    try? dataTask.tokenStorage.set(newToken: TokenContainer(token: responseModel.token, recivingDate: .now))
                } else {
                    try? dataTask.tokenStorage.set(newToken: TokenContainer(token: responseModel.token, recivingDate: Date()))
                }
                onResponseWasReceived(result)
            }
        }
    }
}
