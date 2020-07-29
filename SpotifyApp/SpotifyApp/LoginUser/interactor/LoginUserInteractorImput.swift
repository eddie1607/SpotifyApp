//
//  LoginUserInteractorImput.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol LoginUserInteractorInput {
    func findUser(by name:String, password: String)
}
/// deve manipulara os daddos
class LoginUserInteractor: LoginUserInteractorInput{
    
    var presenter: LoginUserModuleInterface? ///referencia para o presenter
    var manager: LoginUserManager? //usados para fazer as requisicoes
    
    func findUser(by name: String, password: String) {
// manager usado pra fazer requisicoes
        let user = manager?.findUser(by: name, password: password) // busca no maanager  passanaado  esse nome e essa senha

            presenter?.loginResponse(loginUser: user)
    }
    
    
}
