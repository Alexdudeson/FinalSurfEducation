//
//  FavoriteViewController.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 11.08.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()

        
        let searchButton = UIBarButtonItem (image: UIImage(named: "magnifyingglass"), style: .plain, target: self, action: #selector(searchStuff))
        navigationItem.rightBarButtonItem = searchButton
        
    }

    @objc func searchStuff() {
        let searchController = SearchVC()
        navigationController?.pushViewController(searchController, animated: true)
    }
}
