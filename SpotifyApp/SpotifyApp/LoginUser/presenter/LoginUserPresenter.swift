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
        interactor?.findUser(by: email, password: passwd) // interactor deve achar para o presenter o usuario
     }
     
     func forgotPasswdAction() {
         
     }
    /// a resposta do interactor para o presenter caso encontre o usuario ou caso nao encontre o usuario
    func loginResponse(loginUser: LoginUser?) {
        
        if loginUser != nil{
            access()
        }else{
            view?.loginFailed(message: "Failed")///a viiew contem o metodo  com a msg de falha
        }

    }
    func access(){
        
    }
}
