//
//  AppDelegate.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                UITextField.appearance().tintColor = UIColor.SPT.green
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // view
        let view = UserDisconnectedViewController()
        
        // presenter
        let userDisconnectedPresenter = UserDisconnectedPresenter()
        let loginUserPresenter = LoginUserPresenter()
        
        // router
        let userDisconnectedRouter = UserDisconnectedRouter()
        let createAccountRouter = CreateAccountRouter()
        let loginUserRouter = LoginUserRouter()
        
        // interactor
        let userDisconnectedInteractor = UserDisconnectedInteractor()
        let loginUserInteractor = LoginUserInteractor()
        
        // manager
        let userDisconnectedManager = UserDisconnectedManager()
        
        userDisconnectedRouter.presenter = userDisconnectedPresenter
        userDisconnectedRouter.createAccountRouter = createAccountRouter
        userDisconnectedRouter.loginUserRouter = loginUserRouter
        loginUserRouter.presenter = loginUserPresenter
        
        userDisconnectedPresenter.router = userDisconnectedRouter
        userDisconnectedPresenter.view = view
        userDisconnectedPresenter.interactor = userDisconnectedInteractor
        loginUserPresenter.interactor = loginUserInteractor
        
        view.eventHandler = userDisconnectedPresenter
        
        userDisconnectedInteractor.presenter = userDisconnectedPresenter
        userDisconnectedInteractor.manager = userDisconnectedManager
        
        userDisconnectedRouter.presentUserDisconnectedFrom(window: window!, view: view)
        
        for family: String in UIFont.familyNames {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("\(names)")
            }
            
        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

