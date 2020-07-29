//
//  LoginUserPresenter.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
import SafariServices

class LoginUserPresenter: LoginUserModuleInterface{
    
    
    let SpotifyClientID = "f254582fead244228898533acce50058"
    let SpotifyRedirectURL = URL(string: "spoti://callback")!
       
       ///maneira facil de instanciar um sptconfiguration
    var router: LoginUserRouter?
    
    var  view: LoginUserInterface?
    
    var interactor: LoginUserInteractorInput?
    
    var auth: SPTAuth?
    
    var safariVC : SFSafariViewController?///// referencia do safari para
    
    
    //// essa notification  escuta os eventos da web  capturado pelo notification center no metodo open url do appdelegate
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(loginCallback), name: Notification.Name(rawValue: "loginSuccessful"), object: nil)
        }
    
    
    ///// esse metodo  é o selector  aplicado no notification center que escuta os evsentos  vindos da web
    @objc func loginCallback(notification: Notification){
        if let url = notification.userInfo?["url"] as? URL {
            print(url)
            if (self.auth?.canHandle(url))!{  ///verificar dados de acesso
                self.safariVC!.dismiss(animated: true, completion: nil) ////esconde o safari
                self.safariVC = nil
                self.auth?.handleAuthCallback(withTriggeredAuthURL: url, callback: {(error, session) in
                    
                    if let session = session{
                        
                        let userDefaults = UserDefaults.standard //com conceito de user default  e possil gravar  em dados locais a sessao
                        let sessionData = NSKeyedArchiver.archivedData(withRootObject: session)
                        print(sessionData)
                        userDefaults.set(sessionData, forKey: "SpotifySession")
                        userDefaults.synchronize()
                        print(session.accessToken as Any)
                        
                    }
                })
                
            }
            
        }
    }
    
   
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
        self.auth = SPTAuth.defaultInstance() //// instamciar um obj de autenticacao
        self.auth?.clientID = "f254582fead244228898533acce50058"
        self.auth?.redirectURL = URL(string: "spoti://callback")
        self.auth?.sessionUserDefaultsKey = "current session"
        self.auth?.requestedScopes = [SPTAuthStreamingScope] /// tipo de acesso que eu irei solicital
        
        guard let auth = auth else {return} /// descompactar o objeto de autenticcao
        
        if auth.session != nil && auth.session.isValid(){
            
            loginSuccess(session: auth.session)
            
        }else{
            
            loginProcess()///// processo  de login  na web
        }
        

    
        
    }
    func  loginSuccess(session: SPTSession){
        print(session.accessToken! )
        print(session.canonicalUsername!)// nome de user
        print(session.expirationDate!)
        print(session)
        
    }
    func loginProcess(){ //// me connnectta  com o safari
        let  authURL = self.auth?.spotifyWebAuthenticationURL()
        self.safariVC = SFSafariViewController(url: authURL!)///// instancia o safari
        UIApplication.shared.keyWindow?.rootViewController?.present(safariVC!, animated: true, completion: nil)/// apresenta o safari na aplicacao
        ///// a resposta do safari deve sesr  apresentada no appdele
        }
    
}
