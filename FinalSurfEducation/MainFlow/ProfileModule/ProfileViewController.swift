//
//  ProfileViewController.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 10.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imagePicture: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var describtionLabel: UILabel!
    
    
    
    
    
    
    
    @IBAction func exitButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Выход", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Выйти", style: .cancel, handler: {action in
            print("Нажата Отмена")
        }))
        
        present(alert,animated: true)
        
        //TODO- logout
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        imagePicture.image = UIImage(named: "Stranger")
        nameLabel.text = "Хммм"
        describtionLabel.text = "Как говорил мой отец: \n-10 костылей из 10"
        
    }

}
