//
//  UserDisconnectedInteractor.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 14/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

/// essse protocol 'e usado  pelo presenter para  passar dados para o interactor
protocol UserDisconnectedInteractorInput {
    
    var presenter: UserDisconnectedInteractorOutput! { get } //// referencia para interactor
    func findCollectionHighlight() //// protocol e usado pelmanager para 
}
///esees protocol e usado pelo  ipresenter para  apresentar as saidas  dos interator a implementacao susadapelo presenter
protocol UserDisconnectedInteractorOutput {
    func foundCollection(of highlight: [HighlightItem])
}

//// implementacao  do interactor  nessa implementacao deve  conter uma  referencia par ao manager
class UserDisconnectedInteractor: UserDisconnectedInteractorInput {
    
    var presenter: UserDisconnectedInteractorOutput! /// referencia para o presenter
    var manager: UserDisconnectedManager! // referencia para o manager
    
    func findCollectionHighlight() {
        let highlights = manager.findCollectionHighlight()
        self.presenter.foundCollection(of: highlights)
    }
    
}
