//
//  BaseNetworkTask.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 17.08.2022.
//

import Foundation

struct BaseNetworkTask <AbstractInput:Encodable, AbstractOutPut:Decodable> : NetworkTask {
    
    // MARK: -NetworkTask
    
    typealias Input = AbstractInput
    typealias Output = AbstractOutPut
    
    var baseURL: URL? {
     URL(string: "https://pictures.chronicker.fun/api")
    }
    
    let path: String
    let method: NetworkMethod
    let session: URLSession = URLSession (configuration: .default)
    
    
    // MARK: -Initialization
    
    init(method: HTTPNetworkMethod, path:String) {
        self.path = path
        self.method = method
    }
    // MARK: -NetworkTask
    
    func performRequest(input: AbstractInput, _ onResponseWasReceived: (Result<Output, Error>) -> Void) {
        
    }
    
    
    
}

// MARK: -Private Methods

private extension BaseNetworkTask {
    
}


