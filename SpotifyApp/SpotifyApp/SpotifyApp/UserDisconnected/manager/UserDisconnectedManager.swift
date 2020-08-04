//
//  UserDisconnectedManager.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 14/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

//// aqui poderia ser uma requisicao web
class UserDisconnectedManager{
   
    //// essa implementacao  simula  o retorna de uma chamada de rede e  uma implementacaoa diferente do metod o findCollectionhighlight tambem encontrado  no  interactor
    ////sao os titulos a serem apresentados  pelo page control
     
    func findCollectionHighlight() -> [HighlightItem] {
          return [HighlightItem(title: "Title 1", desc: "This is the description 1 Try to do anything in Spotify!"),
                  HighlightItem(title: "Title 2", desc: "This is the description 2 Try to do anything in Spotify!"),
                  HighlightItem(title: "Title 3", desc: "This is the description 3 Try to do anything in Spotify!"),
                  HighlightItem(title: "Title 4", desc: "This is the description 4 Try to do anything in Spotify!"),
                  HighlightItem(title: "Title 5", desc: "This is the description 5 Try to do anything in Spotify!")]
      }
    
}
