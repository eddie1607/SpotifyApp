//
//  SceneDelegate.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
       // guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            UITextField.appearance().tintColor = UIColor.SPT.green /// colaca uma cor no cursor
        self.window = UIWindow(windowScene: windowScene)
            
            /// crinado as instanncias

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
        }
            self.window?.makeKeyAndVisible()
       
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

