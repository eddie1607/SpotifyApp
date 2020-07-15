//
//  UIView+Constraint.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit


extension UIView {
    
    func constraint(pattern: String, views: UIView...) {
        var mViews: [String : UIView] = [:]
        for(index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            mViews["v\(index)"] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: pattern,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                      metrics: nil,
                                                      views: mViews))
    }
}

