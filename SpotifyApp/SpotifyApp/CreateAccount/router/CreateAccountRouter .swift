//
//  CreateAccountRouter .swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//


import UIKit

class CreateAccountRouter {
    
    var view: CreateAccountViewController!
 
    func presentCreateAccountFrom(backView: UINavigationController) {
        self.view = CreateAccountViewController()
        
        let transtion = CATransition()
        transtion.duration = 0.45
        transtion.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transtion.type = CATransitionType.push
        transtion.subtype = CATransitionSubtype.fromRight
        backView.view.layer.add(transtion, forKey: nil)
        
        backView.setNavigationBarHidden(false, animated: false)
        backView.pushViewController(view, animated: false)
    }
    
}
