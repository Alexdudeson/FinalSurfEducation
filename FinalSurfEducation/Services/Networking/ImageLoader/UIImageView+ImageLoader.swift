//
//  UIImageView+ImageLoader.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 19.08.2022.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url:URL) {
        
        ImageLoader().loadImage(from: url) { [weak self] result in
            if case let .success(image) = result {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
        
    }
}
