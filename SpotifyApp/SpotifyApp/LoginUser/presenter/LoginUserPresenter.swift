//
//  LoginUserPresenter.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

class LoginUserPresenter: LoginUserModuleInterface{

    
    
    var description: String = ""
    
    var router: LoginUserRouter?
    
    var  view: LoginUserInterface?
    
    var interactor: LoginUserInteractorInput?
    
    let SpotifyClientID = "f254582fead244228898533acce50058"
    let SpotifyRedirectURL = URL(string: "spoti://callback")!

    /*
    ///maneira facil de instanciar um sptconfiguration
    lazy var configuration = SPTConfiguration(
      clientID: SpotifyClientID,
      redirectURL: SpotifyRedirectURL
    )*/
    lazy var configuration: SPTConfiguration = {
           let configuration = SPTConfiguration(clientID: SpotifyClientID, redirectURL: SpotifyRedirectURL)
           // Set the playURI to a non-nil value so that Spotify plays music after authenticating and App Remote can connect
           // otherwise another app switch will be required
           configuration.playURI = ""

           // Set these url's to your backend which contains the secret to exchange for an access token
           // You can use the provided ruby script spotify_token_swap.rb for testing purposes
           configuration.tokenSwapURL = URL(string: "http://localhost:1234/swap")
           configuration.tokenRefreshURL = URL(string: "http://localhost:1234/refresh")
           return configuration
       }()
    
 /*   lazy var appRemote: SPTAppRemote = {
      let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
      appRemote.connectionParameters.accessToken = self.accessToken
      appRemote.delegate = self
      return appRemote
    }() */

    
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
      //  self.configuration.clientID = SpotifyClientID
       // self.configuration.redirectURL = SpotifyRedirectURL
    }
}
