//
//  HighlightCollectionCell.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 14/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit
class HighlightCollectionCell: UICollectionViewCell{
        
        let lblTitle: SPTLabel = {
            let lbl = SPTLabel()
            return lbl
        }()
        
        let lblDesc: SPTLabel = {
            let lbl = SPTLabel()
            lbl.numberOfLines = 2
            return lbl
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(lblTitle)
            addSubview(lblDesc)
            backgroundColor = .clear
            
            constraint(pattern: "H:|-32-[v0]-32-|", views: lblTitle)
            constraint(pattern: "H:|-32-[v0]-32-|", views: lblDesc)
            
            constraint(pattern: "V:[v0]-8-[v1]|", views: lblTitle, lblDesc)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
