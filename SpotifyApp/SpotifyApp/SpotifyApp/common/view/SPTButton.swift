//
//  SPTButton.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

enum UIButtonColor {
    case primary
    case secondary
}

class SPTButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 36)
        
        self.addConstraint(heightConstraint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?, buttonColor color: UIButtonColor) {
        var uiColor: UIColor!
        switch color {
        case .secondary:
            self.backgroundColor = UIColor.SPT.white
            uiColor = UIColor.black
        case .primary:
            self.backgroundColor = UIColor.SPT.green
            uiColor = UIColor.white
        }
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: "ProximaNova-Bold", size: 13)
            ?? UIFont.systemFont(ofSize: 13),
            NSAttributedString.Key.kern : CGFloat(1.3),
            NSAttributedString.Key.foregroundColor : uiColor
        ]
        let attributedTitle = NSAttributedString(string: title ?? "", attributes: attributes)
        self.setAttributedTitle(attributedTitle, for: state)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
}

