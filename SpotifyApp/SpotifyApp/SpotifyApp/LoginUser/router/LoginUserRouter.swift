//
//  LoginUserRouter.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 19/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class LoginUserRouter{
    
    var presenter: LoginUserModuleInterface!
    
    func presentLoginUserFrom(backView: UINavigationController){
        
     let view = LoginUserViewController()
             view.eventHandler = presenter
             
             let transition = CATransition()
             transition.duration = 0.45
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
             backView.view.layer.add(transition, forKey: nil)
             
             backView.setNavigationBarHidden(false, animated: false)
             backView.pushViewController(view, animated: false)
         }
}
