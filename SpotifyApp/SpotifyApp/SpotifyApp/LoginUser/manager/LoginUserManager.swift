//
//  LoginUserManager.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 04/08/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

class LoginUserManager{
    
    static let fakeUser: [LoginUser] = [LoginUser(username: "Edmilson", password: "123"),
                                        LoginUser(username: "Tiago", password: "123"),
                                        LoginUser(username: "Spoti", password: "Spoti")]
    
    func findUser(by name: String, passoword: String) -> LoginUser?{
        return LoginUserManager.fakeUser.filter{ (user) -> Bool  in
            return user.username == name && user.password == passoword
        }.first
        
    }
    
    
}
