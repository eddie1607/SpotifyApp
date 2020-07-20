//
//  UserDisconnectedPresenter .swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation
//// trata ada implementacao do  presenter no diretorio presenter

class UserDisconnectedPresenter : UserDisconnectedModuleInterface, UserDisconnectedInteractorOutput{
   
    var router: UserDisconnectedRouter?   //// rferencia para o router
    var view: UserDisconnectedInterface? /// referencia  para view
    var interactor: UserDisconnectedInteractorInput?  ////referencia  para interactor
    
    
    
       func showHighlightMessage() {
             interactor?.findCollectionHighlight()
         }
            
    func createAccountAction() {
      router?.presentCreateAccountInterface() /// a implementacao
    }
    
    
    func loginAction() {
        router?.presentLoginUserInterface() //// cria cao e  navegacao
    
    }
   
  
    func foundCollection(of highlight: [HighlightItem]) {
        //// atraves do map 'e possivel interar  dentro  de um array o de e possivel encontrar  um elemento e retornar outro tipo de elemento
        let response  = highlight.map {
            (highlight) -> (String,String) in
            return(highlight.title, highlight.desc)
        }
        view?.show(responses: response) /// a view pega a resposta  e passa para  a collection criada 
    }
    
}
