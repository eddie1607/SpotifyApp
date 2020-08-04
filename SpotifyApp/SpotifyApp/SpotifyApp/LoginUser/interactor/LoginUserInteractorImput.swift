//
//  LoginUserInteractorImput.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol LoginUserInteractorInput {
    
    func findUser(by name:String, password:String)
    
}

class LoginUserInteractor: LoginUserInteractorInput{
    
    var presenter: LoginUserModuleInterface?
    var manager: LoginUserManager?
    
    func findUser(by name: String, password: String) {
        
        let user = manager?.findUser(by: name, passoword: password)
        presenter?.loginResponse(loginUser: user)
    }
    
    
}
