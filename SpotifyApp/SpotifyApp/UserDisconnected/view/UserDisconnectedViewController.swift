//
//  UserDisconnectedViewController.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class UserDisconnectedViewController: UIViewController {
    

    var eventHandler: UserDisconnectedModuleInterface?/////// referencia pra presenter
    
    let btnCreateAccount: SPTButton = {
        let btn = SPTButton()
        btn.setTitle("CREATE ACCOUNT", buttonColor: UIButtonColor.primary)
        btn.addTarget(self, action: #selector(createAccountDidTapped), for: .touchUpInside)
        return btn
    }()
    
    let btnLogin: SPTButton = {
        let btn = SPTButton()
        btn.setTitle("LOG IN", buttonColor: UIButtonColor.secondary)
        btn.addTarget(self, action: #selector(loginDidTapped), for: .touchUpInside)
        return btn
    }()
    
    let alreadyAUser: SPTLabel = {
        let lbl = SPTLabel()
        lbl.text = "Already a user?"
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btnCreateAccount)
        view.addSubview(btnLogin)
        view.addSubview(alreadyAUser)
        
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: btnCreateAccount)
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: btnLogin)
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: alreadyAUser)
        
        view.constraint(pattern: "V:[v0]-12-[v1]-3-[v2]-36-|", views: btnCreateAccount, alreadyAUser, btnLogin)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func createAccountDidTapped() {
        eventHandler?.createAccountAction()
    }
    
    @objc func loginDidTapped() {
        eventHandler?.loginAction()
    }

}
