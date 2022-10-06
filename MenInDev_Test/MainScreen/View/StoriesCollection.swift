//
//  StoriesCollection.swift
//  MenInDev_Test
//
//  Created by Eugene on 20.09.2022.
//

import UIKit

class StoriesCollection: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
        register(StoriesCollectionCell.self, forCellWithReuseIdentifier: StoriesCollectionCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
