//
//  LoginAndPass.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 21.08.2022.
//

import UIKit

class LoginAndPass: UIViewController {
    
    @IBOutlet weak var LoginTextField: UITextField!
    
    @IBOutlet weak var LoginLabel: UILabel!
    
    
    @IBOutlet weak var PasswordTextLabel: UITextField!
    
    @IBOutlet weak var PasswordLabel: UILabel!
    
    
    @IBAction func LoginButton(_ sender: Any) {
        
        let hardCodedLogin:String = "+79876543219" //temp
        let hardCodedPassword:String = "qwerty" //temp

        if LoginTextField.text == hardCodedLogin &&
            PasswordTextLabel.text == hardCodedPassword {
            acsessGranted()
        } else {
            accessDenied()
        }
    }
    
    func acsessGranted() {
        //TODO - actionsheet? Maybe
    }
    
    func accessDenied() {
        let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль введен неправильно", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: {action in
            print("Нажата Отмена")
        }))
        
        present(alert,animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
    }
    
}
