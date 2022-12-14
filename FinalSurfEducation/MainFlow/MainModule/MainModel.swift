//
//  MainModel.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 11.08.2022.
//

import Foundation
import UIKit

final class MainModel {
    
    // MARK: -Events
    
    var didItemsUpdated: (()-> Void)?
    
    // MARK: -Properties
    
    let pictureService = PicturesService()
    var items: [DetailItemModel] = [] {
        didSet {
            didItemsUpdated?()
            
        }
    }
    
    // MARK: -Methods
    
    func loadPosts() {
        pictureService.loadPictures { [weak self] result in
            switch result {
            case .success(let pictures):
                self?.items = pictures.map { pictureModel in
                    DetailItemModel(
                        imageUrlInString: pictureModel.photoUrl,
                        title: pictureModel.title,
                        isFavorite: false, // TODO- FavoriteService
                        content: pictureModel.content,
                        dateCreation: pictureModel.date
                    )
                }
            case .failure(let error):
                // TODO: - Implement error state there
                break
            }
        }
    }
}


