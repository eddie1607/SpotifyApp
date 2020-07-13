//
//  UIColor+Default.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//


import UIKit

extension UIColor {
    
    enum SPT {
        static let green = UIColor.fromHex(0x00c961)
        static let white = UIColor.fromHex(0xFFFFFF)
    }
    
    static func fromHex(_ value: UInt32) -> UIColor {
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(value & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}

