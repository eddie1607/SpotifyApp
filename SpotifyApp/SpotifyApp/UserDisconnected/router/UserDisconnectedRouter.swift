//
//  UserDisconnectedRouter.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class UserDisconnectedRouter {
    
    var presenter: UserDisconnectedModuleInterface!///referencia para o presenter
    var createAccountRouter: CreateAccountRouter?
    var loginUserRouter: LoginUserRouter?
    
    var navigation: UINavigationController?// rota de navegacao
    
    
    func presentUserDisconnectedFrom(window: UIWindow, view: UIViewController) {
        //let view = UserDisconnectedViewController()//// instancia a view que deve ser vista
      //  view.eventHandler = presenter
        
        self.navigation = UINavigationController(rootViewController: view) /// diz que essa e a raiz
        self.navigation?.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigation/// passuma arais
    }
    
    func presentCreateAccountInterface() {
        createAccountRouter?.presentCreateAccountFrom(backView: navigation!)
    }
    
    func presentLoginUserInterface(){
        loginUserRouter?.presentLoginUserFrom(backView: navigation!)
    }
 
}


