//
//  GalleryDetailCell.swift
//  MenInDev_Test
//
//  Created by Eugene on 30.09.2022.
//
import UIKit
import Foundation

class GalleryDetailCell: UICollectionViewCell {
    static let identifier = "GalleryDetailCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        setImage(with: "default")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //imageView.image = nil
    }
    
    func setImage(with url: String){
        imageView.sd_setImage(with: URL(string: url))
    }
}
