//
//  PictureResponseModel.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 18.08.2022.
//

import Foundation

struct PictureResponseModel: Decodable {
    
    let id: String
    let title: String
    let content: String
    let photoUrl: String
//    let publicationDate: String
    
    var date: Date {
        Date(timeIntervalSince1970: publicationDate / 1000)
    }
    
    private let publicationDate: Double
}
