//
//  HighlightCollectionView.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 14/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class HighlightCollectionView: UICollectionView{
       
        private let identifier = "HighlightCollectionCell"
        var response: [(String, String)]? { 
            didSet {
                reloadData()
            }
        }
        
        override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
            super.init(frame: frame, collectionViewLayout: layout)
            
            dataSource = self
            delegate = self
            
            register(HighlightCollectionCell.self, forCellWithReuseIdentifier: identifier)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }

    extension HighlightCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return response?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HighlightCollectionCell
            
            cell.lblTitle.text = response?[indexPath.row].0
            cell.lblDesc.text = response?[indexPath.row].1
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        
    }



