//
//  LoginUserViewController.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class LoginUserViewController: UIViewController, LoginUserInterface{
   
    var eventHandler: LoginUserModuleInterface?///// referencia para  o presenter
    
    let  txtEmail: SPTTextField = {
        let txt = SPTTextField()
        txt.placeholder = "Username ou Email"
        txt.leftImage = #imageLiteral(resourceName: "ic_person_white_18pt")
        txt.autocorrectionType = .no
        txt.spellCheckingType = .no
        return txt
    }()
    
    let txtPasswd: SPTTextField = {
        let txt =  SPTTextField()
        txt.placeholder = "Password"
        txt.leftImage = #imageLiteral(resourceName: "ic_lock_white_18pt")
        txt.autocorrectionType = .no
        txt.spellCheckingType = .no
        txt.isSecureTextEntry = true
        return txt
    }()
    let btnLogin: SPTButton = {
        let btn = SPTButton()
        btn.setTitle("LOG IN", buttonColor: UIButtonColor.primary)
        btn.addTarget(self, action: #selector(loginDidTapped), for:UIControl.Event.touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.fromHex(0x111111)
        navigationController?.navigationBar.barTintColor = UIColor.fromHex(0x090909)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        title = "LOG IN"
        
        view.addSubview(txtEmail)
        view.addSubview(txtPasswd)
        view.addSubview(btnLogin)
        
        view.constraint(pattern: "H:|-16-[v0]-16-|", views: txtEmail)
        view.constraint(pattern: "H:|-16-[v0]-16-|", views: txtPasswd)
        view.constraint(pattern: "H:|-16-[v0]-16-|", views: btnLogin)
        
        view.constraint(pattern: "V:|-80-[v0]-12-[v1]-30-[v2(40)]", views: txtEmail,txtPasswd,btnLogin)

       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillDisappear(animated)
    }
    
    func loginFailed(message: String) {
        print(message)
       }
    @objc func loginDidTapped(){
        guard let  email = txtEmail.text, let password = txtPasswd.text else{return}
        eventHandler?.login(email: email, passwd: password)
        
    }
    

}
