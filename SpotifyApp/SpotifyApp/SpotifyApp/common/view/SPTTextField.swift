//
//  SPTTextField.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 17/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

/// textfield customizado
class SPTTextField: UITextField{
    
    var leftImage: UIImage?{  //// sempre que for atribuido
        didSet{
            leftViewMode = UITextField.ViewMode.always
            let iv = UIImageView(image: leftImage)
            leftView = iv
        }
    }
    override var placeholder: String?{
        didSet{
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor  = .darkGray
        textColor = .white
        font = UIFont(name: "ProximaNova", size: 13) ?? UIFont.systemFont(ofSize: 13)
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 36)
        self.addConstraint(heightConstraint)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// customizando a s distancias  dentro au textfild (uikit)
    // desloca a  imagem
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: 36, height: 36).insetBy(dx: 10, dy: 10) //// inset impurra o componente  10 pontos n ahorizontal e  10 pontos na vertical
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)// empurra 36 pontos na horizontal
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    override func draw(_ rect: CGRect) { /// desenhar as bordas
        layer.cornerRadius = rect.size.height/12 /// controla o raio das bordas
        clipsToBounds = true ///cortara  as bordas 
        super.draw(rect)
    }
    
}
