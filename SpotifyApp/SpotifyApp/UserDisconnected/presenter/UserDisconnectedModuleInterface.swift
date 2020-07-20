//
//  UserDisconnectedModuleInterface.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol UserDisconnectedModuleInterface{
    
    var router: UserDisconnectedRouter? {set get} /// referencia para o routers
    var  view: UserDisconnectedInterface?{set get}
    var interactor: UserDisconnectedInteractorInput?{set get}
    
    func createAccountAction()///  assinatuara de metodos  usados por boytoes  na viewcontroller inicial
    
    func loginAction()///  assinatuara de metodos  usados por boytoes  na viewcontroller inicial
    
    func showHighlightMessage() // 
}
