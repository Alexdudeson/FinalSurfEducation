//
//  PicturesService.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 19.08.2022.
//

import Foundation


struct PicturesService {
    
    let dataTask = BaseNetworkTask<EmptyModel, PictureResponseModel>(method: .post, path: "picture")
    
    func loadPictures(_ onResponseWasReceived: @escaping (_ result: Result<PictureResponseModel, Error>) -> Void) {
        dataTask.performRequest(onResponseWasReceived)
    }
}
