//
//  LoginManager.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 20/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation


/// quando solicitada pelo interator essa classedeve buscar os dados no banco de dados local  ou real ou etc
class LoginUserManager{
     /// dados estaticos simunado  chamada de rede
    
    static let fakesUser:[LoginUser] = [
    LoginUser(username: "edmilson", password: "123"),
    LoginUser(username: "Blabla", password: "blalba")
    ]
    /// o metodo do  interator  deve ser executado aqui
    func  findUser(by name:String, password:String) -> LoginUser? {
        return    LoginUserManager.fakesUser.filter({(user)->Bool in
            return  user.username == name && user.password == password
            }).first
        
    }
}

