//
//  SceneDelegate.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate, SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate{
    
    let SpotifyClientID = "f254582fead244228898533acce50058"
    let SpotifyRedirectURL = URL(string: "spoti://callback")!

    lazy var configuration = SPTConfiguration(
      clientID: SpotifyClientID,
      redirectURL: SpotifyRedirectURL
    )
    
    
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        print("connected")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("Disconnected")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("failed")
    }
    
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        print("player state changed")
    }
    

    var window: UIWindow?
    //var auth = SPTAuth?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        // gif #available(iOS 13.0, *) {
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
    }
                  
                  
    }

         //   self.window?.makeKeyAndVisible()
       
    
    
    //// esse metodo para poder  utilizar o  spotify
@available(iOS 13.0, *)
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
   /*   guard let url = URLContexts.first?.url else {
              return
          }

          let parameters = appRemote.authorizationParameters(from: url);

          if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
              appRemote.connectionParameters.accessToken = access_token
              self.accessToken = access_token
          } else if let error_description = parameters?[SPTAppRemoteErrorDescriptionKey] {
              // Show the error
          } */
      }

@available(iOS 13.0, *)
func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

@available(iOS 13.0, *)
func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

@available(iOS 13.0, *)
func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

@available(iOS 13.0, *)
func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

@available(iOS 13.0, *)
func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }




