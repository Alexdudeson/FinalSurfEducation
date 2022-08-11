//
//  MainItemCollectionViewCell.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 11.08.2022.
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {

    
    // MARK: -Constants
    
    private enum Constants {
        static let fillHeartImage = UIImage(named: "heart-fill")
        static let heartImage = UIImage(named: "heart")
    }
    
    // MARK: -Views
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    // MARK: -Properties
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet {
            let image = isFavorite ? Constants.fillHeartImage : Constants.heartImage
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    // MARK: -Actions
    
    @IBAction private func favoriteAction(_ sender: UIButton) {
    }
    
    
    // MARK: -UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

// MARK: -Private Methods

private extension MainItemCollectionViewCell {
    
    func configureApperance() {
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        
        imageView.layer.cornerRadius = 14
        
        favoriteButton.tintColor = .white
        
    }
    
}

