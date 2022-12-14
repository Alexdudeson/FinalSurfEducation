//
//  MainViewController.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 10.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    // MARK: -Constants
    
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat =  7
        static let spaceBetweenRows: CGFloat = 8
    }
    
    // MARK: -Private Properties
    
    private let model: MainModel = .init()
    
    // MARK: -Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    // MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        model.loadPosts()
        
        let credentials = AuthRequestModel(phone: "+79876543219", password: "qwerty")
        AuthService().performLoginRequestAndSaveToken(credentials: credentials) {
            result in switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        PicturesService().loadPictures { result in
            print(result)
        }
        
        let searchButton = UIBarButtonItem (image: UIImage(named: "magnifyingglass"), style: .plain, target: self, action: #selector(searchStuff))
        navigationItem.rightBarButtonItem = searchButton
    }
    
  
    @objc func searchStuff() {
        let searchController = SearchVC()
        navigationController?.pushViewController(searchController, animated: true)
    }
}





// MARK: -Private Methods

private extension MainViewController {
    
    func configureApperance() {
        navigationItem.title = "Главная"
        collectionView.register(UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16) // making collection prettier
    }
    
    func configureModel() {
        model.didItemsUpdated = {[weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.collectionView.reloadData()
            }
        }
    }
    
}



// MARK: -UICollection

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? MainItemCollectionViewCell {
            let item = model.items [indexPath.row]
            cell.title = item.title
            cell.isFavorite = item.isFavorite
            cell.imageUrlInString = item.imageUrlInString
            cell.didFavoritesTapped = { [weak self] in self?.model.items [indexPath.row].isFavorite.toggle()
            }
        }

        return cell
        
    }
    
    // MARK: - Here we define heights

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenRows) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indecPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indecPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


