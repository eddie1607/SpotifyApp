//
//  LoginUserPresenter.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

class LoginUserPresenter: LoginUserModuleInterface {
    
    var router: LoginUserRouter?
    
    var  view: LoginUserInterface?
    
    var interactor: LoginUserInteractorInput?
    
    func login(email: String, passwd: String) {
         
     }
     
     func forgotPasswdAction() {
         
     }
}
