//
//  UserDisconnectedPresenter .swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
//// trata ada implementacao do  presenter no diretorio presenter

class UserDisconnectedPresenter : UserDisconnectedModuleInterface{
    func createAccountAction() {
      router?.presentCreateAccountInterface() /// a implementacao
    }
    
    
    
    var router: UserDisconnectedRouter?
    
    
    
    func loginAction() {
    
    }
    
    
}
