//
//  UserDisconnectedRouter.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class UserDisconnectedRouter {
    
    var presenter: UserDisconnectedModuleInterface!
    var createAccountRouter: CreateAccountRouter?
    
    var navigation: UINavigationController?
    
    func presentUserDisconnectedFrom(window: UIWindow) {
        let view = UserDisconnectedViewController()
        view.eventHandler = presenter
        
        self.navigation = UINavigationController(rootViewController: view)
        self.navigation?.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigation
    }
    
    func presentCreateAccountInterface() {
        createAccountRouter?.presentCreateAccountFrom(backView: navigation!)
    }
 
}


