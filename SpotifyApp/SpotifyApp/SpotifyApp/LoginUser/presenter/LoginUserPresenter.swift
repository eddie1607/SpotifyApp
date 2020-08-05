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
    
    var auth: SPTAuth?
    
    func login(email: String, passwd: String) {
        interactor?.findUser(by: email, password: passwd)
     }
     
     func forgotPasswdAction() {
         
     }
    func loginResponse(loginUser: LoginUser?) {
        
        if loginUser != nil {
            access()
        }else{
            view?.loginFailed(message: "Failed")
        }
     }
    func access(){
        
    }
    func loginProcess(){
        
    }
    func loginSuccess(){
        
    }
    
}
