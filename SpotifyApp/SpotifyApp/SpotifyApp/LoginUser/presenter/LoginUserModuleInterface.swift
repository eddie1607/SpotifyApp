//
//  LoginUserModuleInterface.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol LoginUserModuleInterface{
    
    var router: LoginUserRouter? {set get}
    
    var view: LoginUserInterface? {set get}
    
    var  interactor: LoginUserInteractorInput? {set get}
    
    func login(email:String, passwd: String)
    
    func forgotPasswdAction()
    
    func loginResponse(loginUser: LoginUser?)
    
    
}

