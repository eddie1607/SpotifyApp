//
//  SPTLabel.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class SPTLabel: UILabel {
    
    override var text: String? {
        didSet {
            let attributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font : UIFont(name: "ProximaNova-Bold", size: 13)
                    ?? UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            
            let attributedTitle = NSAttributedString(string: text ?? "", attributes: attributes)
            self.attributedText = attributedTitle
            textAlignment = .center
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

