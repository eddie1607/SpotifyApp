//
//  HighlightCollectionView.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 14/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class HighlightCollectionView: UICollectionView{
       
        private let identifier = "HighlightCollectionCell" /// necessario para instanciar as  celulas
        var response: [(String, String)]? {  /// quando a view setar uma variavel response os dados devem ser atualizados  aqui
            didSet { //// e usado para       , quando a variavel for setada la na classe UserDisconnectedViewController  os dados sejam recarregados aqui
                reloadData()
            }
        }
        
        override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: layout)
            
            dataSource = self/// declarado  quem e a fonte de ddos
            delegate = self
            
            register(HighlightCollectionCell.self, forCellWithReuseIdentifier: identifier) /// registro de uma celula customizada
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }

///
///// consta aqui a implementacao  dos srespectivos protocolos Delegate e datasourcse
    extension HighlightCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        /// numero de secoes
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        //// numero de itetes que a colecao deve ter
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return response?.count ?? 0
        }
        
        /// usando a celula customizada
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HighlightCollectionCell
            
            cell.lblTitle.text = response?[indexPath.row].0
            cell.lblDesc.text = response?[indexPath.row].1
            
            return cell
        }
         // a altura  e  largura da  celula 
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        
    }



