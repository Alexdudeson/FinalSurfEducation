//
//  AppDelegate.swift
//  FinalSurfEducation
//
//  Created by Alexey Yarov on 10.08.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        startApplicationProcess()
        
        return true
    }
    
    // MARK: -Launch app and check tokenStorage
    
    func startApplicationProcess() {
        runLaunchScreen()
        
        if let tokenContainer = try? tokenStorage.getToken(), !tokenContainer.isExpired {
            runMainFlow()
        } else {
            let tempCredentials = AuthRequestModel(phone: "+79876543219", password: "qwerty")
            AuthService()
                .performLoginRequestAndSaveToken(credentials: tempCredentials) { [weak self]
                    result in
                    switch result {
                    case .success:
                        self?.runMainFlow()
                    case.failure:
                        
                        // MARK: -Handler error, if token was not received
                        break
                    }
                }
        }
    }
    
    
    func runMainFlow(){
        DispatchQueue.main.async {
            self.window?.rootViewController = TabBarConfigurator().configure()
        }
        
    }
    
//    func runLaunchScreen() {
//        let LoginAndPass = UIStoryboard(name: "LoginAndPass", bundle: .main)
//            .instantiateInitialViewController()
//        window?.rootViewController = LoginAndPass
//    }

    func runLaunchScreen() {
        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main)
            .instantiateInitialViewController()
        window?.rootViewController = launchScreenViewController
    }
}

