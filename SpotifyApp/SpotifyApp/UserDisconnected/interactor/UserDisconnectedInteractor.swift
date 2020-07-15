//
//  UserDisconnectedInteractor.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 14/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol UserDisconnectedInteractorInput {
    var presenter: UserDisconnectedInteractorOutput! { get }
    func findCollectionHighlight()
}

protocol UserDisconnectedInteractorOutput {
    func foundCollection(of highlight: [HighlightItem])
}


class UserDisconnectedInteractor: UserDisconnectedInteractorInput {
    
    var presenter: UserDisconnectedInteractorOutput!
    var manager: UserDisconnectedManager!
    
    func findCollectionHighlight() {
        let highlights = manager.findCollectionHighlight()
        self.presenter.foundCollection(of: highlights)
    }
    
}
